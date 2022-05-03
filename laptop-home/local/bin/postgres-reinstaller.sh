sudo systemctl disable postgresql.service
sudo systemctl stop postgresql.service

sudo pacman -R postgresql postgresql-libs

sudo rm -rf /var/lib/postgres
sudo rm -rf /var/log/postgres

sudo userdel postgres

sudo pacman -S postgresql

sudo runuser -l postgres -c 'initdb -D /var/lib/postgres/data'
sudo systemctl enable postgresql.service
sudo systemctl start postgresql.service
sudo -u postgres createuser -s -i -d -r -l -w $(whoami)
createdb $(whoami)
