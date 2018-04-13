#!/bin/bash

sudo apt update && \
sudo apt install -y clamav

if [ -z "/etc/clamav/freshclam.conf.org" ]; then
  cp /etc/clamav/freshclam.conf /etc/clamav/freshclam.conf.org

  cat << EOT | sudo tee /etc/clamav/freshclam.conf > /dev/null
# Automatically created by the clamav-freshclam postinst
# Comments will get lost when you reconfigure the clamav-freshclam package

DatabaseOwner clamav
UpdateLogFile /var/log/clamav/freshclam.log
LogVerbose false
LogSyslog false
LogFacility LOG_LOCAL6
LogFileMaxSize 0
LogRotate true
LogTime true
Foreground false
Debug false
MaxAttempts 5
DatabaseDirectory /var/lib/clamav
DNSDatabaseInfo current.cvd.clamav.net
AllowSupplementaryGroups false
ConnectTimeout 30
ReceiveTimeout 30
TestDatabases yes
ScriptedUpdates yes
CompressLocalDatabase no
SafeBrowsing false
Bytecode true
# NotifyClamd /etc/clamav/clamd.conf
# Check for new database 24 times a day
# Checks 24
Checks 1
DatabaseMirror db.local.clamav.net
DatabaseMirror database.clamav.net
EOT

PROXYHOST=$(echo $http_proxy |sed -e 's#.*://##g' | sed -e 's#:.*##g')
PROXYPORT=$(echo $http_proxy |sed -e 's#.*://##g' | sed -e 's#.*:##g')

  if [ -n "$http_proxy" ];then
    cat << EOT | sudo tee -a /etc/clamav/freshclam.conf >/dev/null
# proxy
HTTPProxyServer $PROXYHOST
HTTPProxyPort $PROXYPORT
EOT
  fi

fi

sudo systemctl restart clamav-freshclam


sudo useradd -m -s $(which nologin) restricted-clamuser
sudo rm -f /home/restricted-clamuser/{.bash_logout,.bashrc,.profile}
sudo mkdir -p /home/restricted-clamuser/virus
sudo chown -R restricted-clamuser.restricted-clamuser /home/restricted-clamuser

sudo mkdir -p /var/log/clamav
sudo chown clamav.clamav /var/log/clamav/

# check command

# daily scan
#  sudo clamscan --max-filesize=999M --max-scansize=999M -i -r --move=/home/restricted-clamuser/virus /home/ -l /var/log/clamav/clamav.log

# full scan
#  sudo clamscan --max-filesize=999M --max-scansize=999M --exclude-dir=/sys/* -i -r --move=/home/restricted-clamuser/virus /


cat << 'EOT' | sudo tee /etc/cron.d/clamav 2>&1 >/dev/null
PATH=/usr/sbin:/usr/bin:/sbin:/bin
TODAY=$(date "+%Y%m%d")

# Activity reports every 10 minutes everyday
5 3 * * 1-6 root clamscan --max-filesize=999M --max-scansize=999M -i -r --move=/home/restricted-clamuser/virus /home/ -l /var/log/clamav/clamav_daily_${TODAY}.log

# Additional run at 23:59 to rotate the statistics file
5 3 * * 0 root clamscan --max-filesize=999M --max-scansize=999M --exclude-dir=/sys/* -i -r --move=/home/restricted-clamuser/virus / -l /var/log/clamav_weekly_${TODAY}.log
EOT

sudo systemctl restart cron
