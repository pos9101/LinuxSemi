#!/bin/bash


#Uninstall ReactJS
rm -rf react_project

#Uninstall NodeJS and NPM
rm -rf /usr/local/node
#rm -r bin/node bin/node-waf include/node lib/node lib/pkgconfig/nodejs.pc share/man/man1/node.1
#sudo rm -r /usr/local/bin/node /usr/local/bin/npm /usr/local/include/node /usr/local/lib/node_modules /usr/local/share/man/man/node.1
rm -r ~/.npm $ rm -r .npm
sed -i 's:export NODE_HOME=/usr/local/node/node-v6.10.1-linux-x64::' /etc/profile
sed -i 's/export PATH\=\$PATH\:\$NODE_HOME\/bin//' /etc/profile
source /etc/profile
