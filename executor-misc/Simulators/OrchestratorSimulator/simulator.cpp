#include "simulator.h"

#include <string.h>
using namespace std;

Simulator::Simulator()
{
    registerMetaTypes();

    m_nLastTaskId = 0;

    m_pProcessorExecutor =
            new OrgEsaSen2agriProcessorsExecutorInterface(OrgEsaSen2agriProcessorsExecutorInterface::staticInterfaceName(),
                                                       QStringLiteral("/org/esa/sen2agri/processorsExecutor"),
                                                       QDBusConnection::systemBus());
}

void Simulator::HandleSendExecuteProcessor()
{
/*    QSettings settings ("./orchestrator.ini", QSettings::IniFormat);
    QString strIp = settings.value("SRV_IP", "127.0.0.1").toString();
    QString strPort = settings.value("PORT_NO", "7777").toString();
    QString strWrapperPath = settings.value("WRAPPER_PATH", "./sen2agri-processor-wrapper").toString();
*/
    NewExecutorStepList listSteps;
    for(int i = 0; i < 2; i++) {
        NewExecutorStep step;
        step.taskId = (++m_nLastTaskId);
        step.stepName = QString("StepName_%1_%2").arg(QString::number(m_nLastTaskId), QString::number(i+1));
        step.processorPath = "/usr/bin/otbcli";
        StepArgument stepArg;
        stepArg.value = QString("MaskHandler");
        step.arguments.append(stepArg);
        stepArg.value = QString("-xml");
        step.arguments.append(stepArg);
        stepArg.value = QString("/mnt/Sen2Agri_DataSets/L2A/Spot4-T5/Ukraine/SPOT4_HRVIR1_XS_20130318_N2A_EUkraineD0000B0000/SPOT4_HRVIR1_XS_20130318_N2A_EUkraineD0000B0000.xml");
        step.arguments.append(stepArg);
        stepArg.value = QString("-out");
        step.arguments.append(stepArg);
        stepArg.value = QString("/mnt/scratch/183/1252-composite-mask-handler/all_masks_file.tif");
        step.arguments.append(stepArg);
        stepArg.value = QString("-sentinelres");
        step.arguments.append(stepArg);
        stepArg.value = QString("20");
        step.arguments.append(stepArg);

        listSteps.append(step);
    }
    qDebug() << "Submitting steps to executor ...";
    auto promise = m_pProcessorExecutor->SubmitSteps(listSteps);
    promise.waitForFinished();
    qDebug() << promise.error().message();
    qDebug() << "Submit steps finished!";
}

void Simulator::HandleSendCancelProcessor()
{
    if(m_nLastTaskId != -1)
    {
        TaskIdList listIds;
        listIds.append(m_nLastTaskId);

        qDebug() << "Cancelling tasks ...";
        m_pProcessorExecutor->CancelTasks(listIds);
        qDebug() << "Cancel task finished!";
    }
}
