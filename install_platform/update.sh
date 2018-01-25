#!/bin/sh

systemctl stop sen2agri-scheduler sen2agri-executor sen2agri-orchestrator sen2agri-http-listener sen2agri-sentinel-downloader sen2agri-landsat-downloader sen2agri-demmaccs sen2agri-sentinel-downloader.timer sen2agri-landsat-downloader.timer sen2agri-demmaccs.timer sen2agri-monitor-agent

yum -y install python-dateutil
yum -y update postgis2_94 geos
yum -y install ../rpm_binaries/*.rpm

ldconfig

cat migrations/migration-1.3-1.3.1.sql | su -l postgres -c "psql sen2agri"
cat migrations/migration-1.3.1-1.4.sql | su -l postgres -c "psql sen2agri"
cat migrations/migration-1.4-1.5.sql | su -l postgres -c "psql sen2agri"
cat migrations/migration-1.5-1.6.sql | su -l postgres -c "psql sen2agri"
cat migrations/migration-1.6-1.6.2.sql | su -l postgres -c "psql sen2agri"
cat migrations/migration-1.6.2-1.7.sql | su -l postgres -c "psql sen2agri"
cat migrations/migration-1.7-1.7.1.sql | su -l postgres -c "psql sen2agri"

systemctl daemon-reload

mkdir -p /mnt/archive/reference_data
echo "Copying reference data"
if [ -d ../reference_data/ ]; then
    cp -rf ../reference_data/* /mnt/archive/reference_data
fi

systemctl start sen2agri-executor sen2agri-orchestrator sen2agri-http-listener sen2agri-sentinel-downloader sen2agri-landsat-downloader sen2agri-demmaccs sen2agri-sentinel-downloader.timer sen2agri-landsat-downloader.timer sen2agri-demmaccs.timer sen2agri-monitor-agent sen2agri-scheduler
