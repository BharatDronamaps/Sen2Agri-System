#include <QHostAddress>
#include <QTcpSocket>

#include "simpletcpexecinfosprotsrv.h"
#include "simpletcpexecinfoconnection.h"
#include "logger.hpp"

SimpleTcpExecInfosProtSrv::SimpleTcpExecInfosProtSrv() { m_pServer = NULL; }

SimpleTcpExecInfosProtSrv::~SimpleTcpExecInfosProtSrv() { StopServer(); }

int SimpleTcpExecInfosProtSrv::StartServer(QString &strSrvAddr, int nPort)
{
    Q_UNUSED(strSrvAddr);

    m_pServer = new QTcpServer(this);
    if (!m_pServer->listen(QHostAddress::Any, nPort)) {
        Logger::error(QString("Unable to listen on port %1.")
                          .arg(nPort));
        return 0;
    }

    connect(m_pServer, &QTcpServer::newConnection, this,
            &SimpleTcpExecInfosProtSrv::handleConnection);

    return 1;
}

void SimpleTcpExecInfosProtSrv::StopServer()
{
    if (m_pServer) {
        m_pServer->close();
        m_pServer->deleteLater();
    }

    m_pServer = NULL;
}

void SimpleTcpExecInfosProtSrv::handleConnection()
{
    auto socket = m_pServer->nextPendingConnection();
    auto connection = new SimpleTcpExecInfoConnection(socket, this);

    connect(connection, &SimpleTcpExecInfoConnection::message, this,
            &SimpleTcpExecInfosProtSrv::handleMessage);
}

void SimpleTcpExecInfosProtSrv::handleMessage(const QByteArray &data) { HandleNewMessage(data); }
