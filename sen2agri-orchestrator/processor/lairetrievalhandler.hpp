#ifndef LAIRETRIEVALHANDLERNEW_HPP
#define LAIRETRIEVALHANDLERNEW_HPP

#include "processorhandler.hpp"

#include "ndvihandler.hpp"
#include "lairetrievalhandler_l3b.hpp"
#include "lairetrievalhandler_l3b_new.hpp"
#include "lairetrievalhandler_l3c.hpp"

class LaiRetrievalHandler : public ProcessorHandler
{
    virtual void SetProcessorDescription(const ProcessorDescription &procDescr) override;

private:
    void HandleJobSubmittedImpl(EventProcessingContext &ctx,
                                const JobSubmittedEvent &event) override;
    void HandleTaskFinishedImpl(EventProcessingContext &ctx,
                                const TaskFinishedEvent &event) override;
    ProcessorJobDefinitionParams GetProcessingDefinitionImpl(SchedulingContext &ctx, int siteId, int scheduledDate,
                                                const ConfigurationParameterValueMap &requestOverrideCfgValues) override;

    bool IsGenMonoDate(const QJsonObject &parameters, std::map<QString, QString> &configParameters);
    bool IsGenNdviMonoDateOnly(std::map<QString, QString> &configParameters);
    bool IsNewLaiMonoDateVersion(std::map<QString, QString> &configParameters);
    bool IsNDayReproc(const QJsonObject &parameters, std::map<QString, QString> &configParameters);
    bool IsFittedReproc(const QJsonObject &parameters, std::map<QString, QString> &configParameters);

private:
    // TODO add the subhandlers here
    NdviHandler m_ndviHandler;
    LaiRetrievalHandlerL3B m_l3bHandler;
    LaiRetrievalHandlerL3BNew m_l3bHandlerNew;
    LaiRetrievalHandlerL3C m_l3cHandler;
};

#endif // LAIRETRIEVALHANDLERNEW_HPP

