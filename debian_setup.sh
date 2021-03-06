apt-get update
sudo apt install -y vim tmux htop build-essential w3m w3m-img zsh curl wget git net-tools vlc ffmpeg maven fdisk wicd acpi rcconf build-essential
sudo apt install -y libtool pkg-config autoconf automake

# oh my zsh #
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##############################
# dwm #
##############################
# apt-get source dwm
sudo apt install -y libx11-dev libxft-dev libxinerama-dev dmenu xterm
# change config.def.h. MASK1KEY(Alt) -> MASK4KEY (windows)
# ~.xinitrc
# exec dwm

##############################
# nodejs ##
##############################
sudo apt install -y nodejs npm

##############################
# python #
##############################
sudo apt install -y python-pip python3
pip install virtualenv pipenv
# python -m virtualenv --python=python2


##############################
# chromium
##############################
sudo apt install -y chromium


##############################
# postgres #
##############################
apt install -y postgresql postgresql-contrib

# show postgresql version
sudo -u postgres psql -c "SELECT version();"

# to login to postgreql server
sudo su - postgres
psql
# exit
 \q

# create new postgresql role
su - postgres -c "createuser john"

# create new postgresql database
su - postgres -c "createdb johndb"

# grant privileges
sudo -u postgres psql
grant all privileges on database johndb to john;

# restart
sudo service postgresql restart

# xrand
xrandr --output VGA-1 --auto --above LVDS-1
--right-of
--left-of
--above
--below


#java
apt update
sudo apt install openjdk-8-jdk

vim /etc/profile
find /usr/lib/jvm/java-1.x.x-openjdk

# add eclipse to dmenu
sudo ln -s /home/debian/eclipse/javascript-2020-06/eclipse/eclipse /usr/local/bin
