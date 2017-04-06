#!/bin/bash

echo "설치 마법사를 시작합니다."
echo "설치 하시겠습니까? 1.설치 2.취소"
select yn in "Yes" "No" ; do

	case $yn in

Yes)

#Oracle 11xe install
rm -rf /etc/oratab

PWD=`pwd`
OCinstall(){
	yum install -y libaio bc flex;
	rpm -ivh $PWD/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm;
	\cp -b $PWD/oracle-xe /etc/init.d/oracle-xe;

	/etc/init.d/oracle-xe configure;

	echo "export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe" >> /etc/bashrc;
	echo "export ORACLE_SID=XE" >> /etc/bashrc;
	echo "export NLS_LANG=\`\$ORACLE_HOME/bin/nls_lang.sh\`" >> /etc/bashrc;
	echo "export PATH=\$ORACLE_HOME/bin:\$PATH" >> /etc/bashrc;
	source /etc/bashrc
	echo "ORACLE x11g 설치가 완료되었습니다.";
	echo "터미널을 다시 실행해 주세요";
}
OCinstall


#node JS and ReactJS setup

#node.js v6 LTS
wget https://nodejs.org/dist/v6.10.1/node-v6.10.1-linux-x64.tar.xz
xz -d node-v6.10.1-linux-x64.tar.xz
tar -xvf node-v6.10.1-linux-x64.tar
mkdir /usr/local/node
mv node-v6.10.1-linux-x64 /usr/local/node/
rm -rf node-v6.10.1-linux-x64.tar
printf "export NODE_HOME=/usr/local/node/node-v6.10.1-linux-x64\nexport PATH=\$PATH:\$NODE_HOME/bin\n" >> /etc/profile
source /etc/profile

###################################################
# identify setting and #4~ #13 is ReactJS setting #
###################################################
git --version
node --version
npm --version

#4
npm install -g webpack webpack-dev-server
#5 
mkdir react_project
#
cd react_project
#
npm init -y
#7 
npm install --save react react-dom
#8 
npm install --save-dev babel-core babel-loader babel-preset-es2015 babel-preset-react
npm install --save-dev react-hot-loader webpack webpack-dev-server
sed -i 's/&& exit 1\"/&,\n\t"dev-server": "webpack-dev-server"/' package.json
#9 
printf "var webpack = require('webpack');\nmodule.exports = {\n\tentry: './src/index.js',\n\n\toutput: {\n\t\tpath:__dirname + '/public/',\n\t\tfilename: 'bundle.js'\n},\n\ndevServer: {\n\thot:true,\n\tinline: true,\n\thost: '0.0.0.0',\n\tport: 4000,\n\tcontentBase: __dirname + '/public/',\n},\n\nmodule: {\n\tloaders: [\n\t\t{\n\t\t\ttest: /\\.js$/,\n\t\t\tloader: 'babel-loader',\n\t\t\texclude: /node_modules/,\n\t\t\tquery: {\n\t\t\t\tcacheDirectory: true, \n\t\t\t\tpresets: ['es2015', 'react']\n\n\t\t\t}\n\t\t}\n\t]\n},\n\nplugins: [\n\tnew webpack.HotModuleReplacementPlugin()\n\t]\n};" > webpack.config.js
#10 
mkdir public
printf "<"'!'"DOCTYPE html>\n<html>\n<head>\n<meta charset=\"UTF-8\">\n<title>React Hello</title>\n</head>\n<body>\n\t<div id=\"title\">yangssem</div>\n\t<script src=\"bundle.js\"></script>\n</body>\n</html>" > public/index.html
#11 
mkdir -p src/components
printf "import React from 'react';\nclass App extends React.Component{\n\trender() {\n\t\treturn(\n\t\t\t\t<h1> Hello Yangssem</h1>\n\t\t);\n\t}\n}\nexport default App;\n" > src/components/App.js

#12 
printf "{\n\t\"esversion\":6\n}" > .jshintrc

#13 
printf "import React from 'react';\nimport ReactDOM from 'react-dom';\nimport App from './components/App';\n\nconst rootElement = document.getElementById('title');\nReactDOM.render(<App />, rootElement);" > src/index.js

#14

#16 

#mongod --version


#tomcat install


#톰켓설치

cd /usr/local

wget http://mirror.apache-kr.org/tomcat/tomcat-8/v8.5.13/bin/apache-tomcat-8.5.13.tar.gz

tar xzf apache-tomcat-8.5.13.tar.gz
rm -rf apache-tomcat-8.5.13.tar.gz

sed -i 's/8080/8090/g' /usr/local/apache-tomcat-8.5.13/conf/server.xml


# cron 예약실행, 예약종료

touch /usr/local/apache-tomcat-8.5.13/bin/Instart.sh
touch /usr/local/apache-tomcat-8.5.13/bin/Instop.sh

chmod +x /usr/local/apache-tomcat-8.5.13/bin/In*

echo "\`/usr/local/apache-tomcat-8.5.13/bin/catalina.sh run\`" > /usr/local/apache-tomcat-8.5.13/bin/Instart.sh
echo "00 09 * * * root  /usr/local/apache-tomcat-8.5.13/bin/Instart.sh" >> /etc/crontab

echo "\`/usr/local/apache-tomcat-8.5.13/bin/catalina.sh stop\`" > /usr/local/apache-tomcat-8.5.13/bin/Instop.sh
echo "00 12 * * * root  /usr/local/apache-tomcat-8.5.13/bin/Instop.sh" >> /etc/crontab

systemctl restart crond


;;
No) echo "설치를 취소 했습니다."

;;

esac
exit
done
