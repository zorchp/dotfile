#!/bin/bash

# system tools
sudo apt install neofetch
sudo apt install tree curl git cpu-checker mosh 
sudo apt install cockpit # system monitor by webtree
sudo apt install gdb make
sudo apt-get install gcc-multilib g++-multilib
sudo apt install libcap-dev # sys/capability.h
sudo apt install libacl1-dev # sys/acl.h
# sql
sudo apt install mysql-server
sudo apt install libmysqlclient-dev # <mysql/mysql.h>
sudo apt-get install mongodb

# firewall
sudo apt install firewalld
sudo apt install iptables

# front-end tools
sudo apt install nodejs
sudo apt install npm
npm config set registry https://registry.npm.taobao.org/
# npm_config_registry=http://registry.npmmirror.com npx npm-mirror-set taobao # change mirrors
npm install pm2 -g

# GUI
sudo apt install gnome-panel gnome-icon-theme gnome-settings-daemon metacity nautilus gnome-terminal ubuntu-desktop
sudo apt install xfce4 sfce4-goodies tightvncserver
sudo apt-get install autocutsel # vnc with clipboard

# prompt config
echo "PS1='\033[0;31m\${debian_chroot:+(\$debian_chroot)}\u@\h:\w\033[0m\$ '" >>~/.bashrc

# alias:
echo "alias vb='vi ~/.bashrc'" >>~/.bashrc
echo "alias sb='source ~/.bashrc'" >>~/.bashrc

echo "alias addtcp='func_tcp() { firewall-cmd --zone=public --add-port=\$1/tcp --permanent && iptables -I INPUT -ptcp --dport \$1 -j ACCEPT; };func_tcp'" >>~/.bashrc
echo "alias addudp='func_udp() { firewall-cmd --zone=public --add-port=\$1/udp --permanent && iptables -I INPUT -pudp --dport \$1 -j ACCEPT; };func_udp'" >>~/.bashrc
echo "alias reufw='firewall-cmd --reload'" >>~/.bashrc
echo "alias port_status='func_port_status() { sudo netstat -tunlp | grep \$1 && sudo iptables -L -n --line-numbers | grep \$1; }; func_port_status'" >>~/.bashrc
echo "alias cl=clear" >>~/.bashrc

echo "alias gcl='git clone'" >> ~/.bashrc
echo "alias uvpn='pm2 stop /opt/clash/start_clash.sh'" >> ~/.bashrc
echo "alias vpn='pm2 start /opt/clash/start_clash.sh'" >> ~/.bashrc

echo "alias vv='export https_proxy=http://127.0.0.1:7893 http_proxy=http://127.0.0.1:7893 all_proxy=socks5://127.0.0.1:7893'" >> ~/.bashrc
echo "alias uv='unset https_proxy http_proxy all_proxy'" >> ~/.bashrc

echo "alias goo='curl -vvv google.com'" >> ~/.bashrc

# sql-config
sudo mkdir -p /data/db
sudo systemctl enable mongodb
sudo systemctl start mongodb
sudo systemctl status mongodb

# # sdkman and gradle
# curl -s "https://get.sdkman.io" | bash
