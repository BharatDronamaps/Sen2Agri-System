#pragma once

#include <utility>

#include <QString>
#include <QtSql>

#include "qsqldatabaseraii.hpp"
#include "configurationparameter.hpp"
#include "sql_error.hpp"

class DBProvider
{
    QSqlDatabaseRAII getDatabase() const;

public:
    DBProvider();

    ConfigurationParameterList GetConfigurationParameters(const QString &prefix);
    void UpdateConfigurationParameters(const ConfigurationParameterList &parameters);

    bool shouldRetryTransaction(const sql_error &e);
    QString getErrorName(const sql_error &e);
    void warnRecoverableErrorAbort(const sql_error &e, const QString &operation);
    void warnRecoverableError(const sql_error &e,
                              const QString &operation,
                              int retryDelay,
                              int retryNumber,
                              int maxNetries);

    template <typename F>
    auto handleTransactionRetry(const QString &operation, F &&f) -> decltype(f())
    {
        static const int maxTxnRetries = 10;
        static const int initialRetryDelay = 1000;
        static const int maxRetryDelay = 8000;

        int retryDelay = 0;
        int txnRetryNumber = 0;
        while (true) {
            try {
                return f();
            } catch (const sql_error &e) {
                if (!shouldRetryTransaction(e)) {
                    throw;
                } else if (++txnRetryNumber > maxTxnRetries) {
                    warnRecoverableErrorAbort(e, operation);
                    throw;
                } else {
                    if (!retryDelay) {
                        retryDelay = initialRetryDelay;
                    } else if (retryDelay * 2 <= maxRetryDelay) {
                        retryDelay *= 2;
                    }

                    warnRecoverableError(e, operation, retryDelay, txnRetryNumber, maxTxnRetries);

                    QThread::msleep(retryDelay);
                }
            }
        }
    }
};