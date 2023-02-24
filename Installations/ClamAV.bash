sudo apt-get update

sudo apt-get install clamav clamav-daemon -y

sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam

nano /root/update-antivirus.sh
#!/bin/sh
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam

chmod 777 /root/update-antivirus.sh

/root/update-antivirus.sh

crontab -e
0 0 * * * /root/update-antivirus.sh

