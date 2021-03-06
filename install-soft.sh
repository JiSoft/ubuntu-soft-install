#!/bin/sh

# Remove no longer needed packages
sudo apt-get purge brasero -y
sudo apt-get purge hexchat -y
sudo apt-get purge pix -y
sudo apt-get purge rhythmbox -y
sudo apt-get purge pidgin -y
sudo apt-get purge xplayer -y
# intel video driver - 
# should remove after changing of video driver in 
# Settings -> Driver Manager
#sudo apt-get remove xserver-xorg-video-intel -y

# Update
sudo apt-get update -y
sudo apt-get upgrade -y --force-yes
sudo apt-get autoclean -y
sudo apt-get autoremove -y
sudo apt-get install -f

sleep 1

# Add the repositories
# [ PHP ]
sudo add-apt-repository ppa:ondrej/php -y
# [ User soft ]
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo add-apt-repository ppa:webupd8team/tor-browser -y
sudo add-apt-repository ppa:rvm/smplayer -y
sudo add-apt-repository ppa:caffeine-developers/ppa -y
sudo add-apt-repository ppa:notepadqq-team/notepadqq -y
sudo add-apt-repository ppa:me-davidsansome/clementine -y
sudo add-apt-repository ppa:graysky/utils -y
sudo add-apt-repository ppa:trebelnik-stefina/ubuntu-tweak -y
sudo add-apt-repository ppa:nathan-renniewaldock/flux -y
# [ Mongo 3.6 ]
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
# [ Redis ]
sudo add-apt-repository ppa:chris-lea/redis-server -y

sleep 2

# Update before install
sudo apt-get update -y

#Install
# [ User soft ]
sudo apt-get install google-chrome-stable -y
sudo apt-get install tor-browser -y
sudo apt-get install pavucontrol -y
sudo apt-get install clementine -y
sudo apt-get install audacity -y
sudo apt-get install smplayer smtube smplayer-themes -y
sudo apt-get install ffmpeg -y
sudo apt-get install gnome-paint -y
sudo apt-get install pinta -y
sudo apt-get install shutter -y
sudo apt-get install notepadqq -y
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/bin/youtube-dl
sudo chmod a+rx /usr/bin/youtube-dl
sudo apt-get install ubuntu-tweak -y
sudo apt-get install fluxgui -y
sudo apt-get install dconf-editor -y
sudo apt-get install dconf-tools -y
sudo apt-get install profile-cleaner -y
sudo apt-get install caffeine -y
sudo apt-get install rar -y
sudo apt-get install unrar -y
sudo apt-get install p7zip -y
sudo apt-get install p7zip-full -y
sudo apt-get install p7zip-rar -y
sudo apt-get install xclip - y
# [ Dev soft ]
sudo apt-get -y install wget curl mc nmap htop terminator fonts-powerline
# [ Sys Utils ]
apt install -y ranger neofetch feh ncdu
# [vim]
sudo apt-get install vim -y
mkdir ~/.vim/swap
mkdir ~/.vim/backup
# [git]
sudo apt-get install git gitk -y
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.b branch
git config --global alias.br 'branch -v -a'
git config --global alias.last 'log -1 HEAD'
git config --global alias.v '!gitk'
# [nginx]
sudo apt-get -y install nginx
# [ nvm ]
sudo apt-get install -y build-essential libssl-dev
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source ~/.profile
# [ PHP ]
sudo apt-get install php7.2-cli -y
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew
sudo mv phpbrew /usr/local/bin/phpbrew
phpbrew init
echo "[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc" >> ~/.bashrc
sudo apt-get install php-xdebug
# [ MySQL]
sudo apt-get install mysql-server -y
# [ Mongo ]
sudo apt-get install -y mongodb-org mongodb-clients
sudo service mongod start
sudo systemctl enable mongod
# [ Redis ]
sudo apt-get install redis-server -y
# [ Secure soft ]
sudo apt-get install secure-delete
sudo apt-get install pwgen
sudo apt-get install pass
# [ Admin soft ]
sudo aptitude install lnav
# [ Just for fun ]
sudo apt install cowsay hollywood cmatrix

# Colorize prompt
echo "export PS1=\"\[\e[35m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[31m\]\\$\[\e[m\] \"" >> ~/.bashrc
source ~/.bashrc

# Easy search in terminal command history 
# by typing first letters and then <Up> twice
# it looks more comfortable then <Ctrl-r> searching
# cause it saves cursor position at the same place
# and requires less key pressing then by <Ctrl-r> way
echo '"\e[A": history-search-backward' > ~/.inputrc
echo '"\e[B": history-search-forward' >> ~/.inputrc

# Clean & update after install
sleep 2
sudo apt-get update -y
sudo apt-get upgrade -y --force-yes
sudo apt-get autoclean -y
sudo apt-get autoremove -y
sudo apt-get install -f
sudo find /var/log -type f -name «*.gz» -delete

echo "\nSystem is updated, software are installed\n"
sleep 15

sudo reboot
