#!/bin/bash
clear;
echo "This is Oracle Install Wizard";
echo -n "Present Work Directory ==> "
rm -rf /etc/oratab
PWD=`pwd`
echo "$PWD"
echo;
echo;

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

echo "ORACLE X11g 설치 마법사 입니다.";
echo "작업할 항목을 선택해 주세요.";
echo "1) ORACLE x11g 설치하기";
echo "2) ORACLE x11g 삭제하기";
echo -n "==> ";
read LINE

case $LINE in
	1) echo "ORACLE x11g를 설치합니다.";
		echo "잠시만 기다려 주세요....";
		OCinstall;;
	2) echo "ORACLE x11g를 삭제합니다.";
		echo "잠시만 기다려 주세요....";
		OCuninstall;;
	*) echo "잘못선택하셨습니다.";;	
esac
