sudo apt-get update

sudo apt-get install clamav clamav-daemon -y

sudo systemctl stop clamav-freshclam

sudo freshclam

sudo systemctl start clamav-freshclam

sudo mkdir /root/shell-script/

# -- Script to Update Antivirus --

sudo nano /root/shell-script/update-antivirus.sh

#!/bin/sh
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam

sudo chmod 777 /root/shell-script/update-antivirus.sh

sudo chmod +x /root/shell-script/update-antivirus.sh

crontab -e

0 0 * * * /root/shell-script/update-antivirus.sh

sudo /root/shell-script/update-antivirus.sh

 # -- Script to Clean Antivirus --

sudo nano /root/shell-script/run-antivirus-scan.sh

#!/bin/sh
sudo clamscan -r -i / &

sudo chmod 777 /root/shell-script/run-antivirus-scan.sh

sudo chmod +x /root/shell-script/run-antivirus-scan.sh

crontab -e

30 12,03 * * * /root/shell-script/run-antivirus-scan.sh

sudo /root/shell-script/run-antivirus-scan.sh