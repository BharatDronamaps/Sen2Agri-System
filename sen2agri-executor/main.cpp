#include <stdexcept>
#include <QCoreApplication>
#include <QDBusError>

#include "logger.hpp"
#include "orchestratorrequestshandler.h"
#include "ressourcemanageritf.h"
#include "configurationmgr.h"
#include "execinfosprotsrvfactory.h"
#include "processorsexecutor_adaptor.h"
#include "persistenceitfmodule.h"

#define SERVICE_NAME "org.esa.sen2agri.processorsExecutor"

int main(int argc, char *argv[])
{
    try {
        QString str;
        QCoreApplication a(argc, argv);

        qDebug() << "Current execution path: " << QDir::currentPath();

        registerMetaTypes();

        // get the configuration from the persistence manager
        PersistenceItfModule::GetInstance()->RequestConfiguration();

        // Initialize the server for receiving the messages from the executing Processor Wrappers
        QString strIpVal;
        QString strPortVal;
        AbstractExecInfosProtSrv *pExecInfosSrv =
            ExecInfosProtSrvFactory::GetInstance()->CreateExecInfosProtSrv(
                ExecInfosProtSrvFactory::SIMPLE_TCP);
        str = QString("SRV_IP_ADDR");
        ConfigurationMgr::GetInstance()->GetValue(str, strIpVal);
        str = QString("SRV_PORT_NO");
        ConfigurationMgr::GetInstance()->GetValue(str, strPortVal);
        pExecInfosSrv->SetProcMsgListener(RessourceManagerItf::GetInstance());
        if (!pExecInfosSrv->StartCommunication(strIpVal, strPortVal.toInt())) {
            QString str = QString("Unable start communication for IP %1 and port %2. The application cannot start!")
                    .arg(strIpVal).arg(strPortVal);
            throw std::runtime_error(str.toStdString());
        }

        // start the ressource manager
        RessourceManagerItf::GetInstance()->Start();

        // Initialize the DBus for Orchestrator requests handling
        OrchestratorRequestsHandler orchestratorReqHandler;
        new ProcessorsExecutorAdaptor(&orchestratorReqHandler);

        QDBusConnection connection = QDBusConnection::systemBus();

        if (!connection.registerObject("/org/esa/sen2agri/processorsExecutor",
                                       &orchestratorReqHandler)) {
            QString str = QString("Error registering the object with D-Bus: %1, exiting.")
                              .arg(connection.lastError().message());

            throw std::runtime_error(str.toStdString());
        }

        if (!connection.registerService(SERVICE_NAME)) {
            QString str = QString("Error registering the object with D-Bus: %1, exiting.")
                              .arg(connection.lastError().message());

            throw std::runtime_error(str.toStdString());
        }

        return a.exec();
    } catch (const std::exception &e) {
        Logger::fatal(e.what());
    }
}
