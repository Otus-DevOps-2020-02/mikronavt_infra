#!/bin/bash
set -e

cp /tmp/application.service /etc/systemd/system/application.service
#systemctl daemon-reload
chmod 644 /etc/systemd/system/application.service
systemctl start application.service
systemctl status application.service
systemctl enable application.service
