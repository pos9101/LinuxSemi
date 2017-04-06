#!/bin/bash

echo "삭제를 시작합니다."
echo "삭제 하시겠습니까? 1.Yes 2.No"
select yn in "Yes" "No" ; do
	case $yn in

Yes)

#node JS and ReactJS uninstall

#Uninstall ReactJS
rm -rf react_project

#Uninstall NodeJS and NPM
rm -rf /usr/local/node
#rm -r bin/node bin/node-waf include/node lib/node lib/pkgconfig/nodejs.pc share/man/man1/node.1
#sudo rm -r /usr/local/bin/node /usr/local/bin/npm /usr/local/include/node /usr/local/lib/node_modules /usr/local/share/man/man/node.1
rm -r ~/.npm $ rm -r .npm
sed -i 's:export NODE_HOME=/usr/local/node/node-v6.10.1-linux-x64::' /etc/profile
sed -i 's/export PATH\=\$PATH\:\$NODE_HOME\/bin//' /etc/profile

#no generating
echo "source /etc/profile"
source /etc/profile


#tomcat install

#톰켓삭제

rm -rf /usr/local/apache-tomcat*

sed -i '/apache-tomcat-8.5.13/d' /etc/crontab

#Oracle Delete

PWD=`pwd`
OCuninstall(){
	rpm -evh oracle-xe-11.2.0-1.0.x86_64;
	rm -rf /u01/

	sed -i 's/export ORACLE_HOME\=\/u01\/app\/oracle\/product\/11.2.0\/xe//' /etc/bashrc
	sed -i 's/export ORACLE_SID\=XE//' /etc/bashrc
	sed -i 's/export NLS_LANG\=`\$ORACLE_HOME\/bin\/nls_lang.sh`//' /etc/bashrc
	sed -i 's/export PATH\=\$ORACLE_HOME\/bin\:\$PATH//' /etc/bashrc
	source /etc/bashrc
	echo "ORACLE x11g 삭제가 완료되었습니다.";
	echo "터미널을 다시 실행해 주세요";
}
OCuninstall
rm -rf /etc/oratab
;;

No) echo "삭제를 취소했습니다."

;;

esac
exit
done
