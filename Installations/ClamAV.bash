sudo apt-get update

sudo apt-get install clamav clamav-daemon -y

sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam

nano update-antivirus.sh
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam

chmod 777 update-antivirus.sh

crontab -e
0 0 * * * update-antivirus.sh

