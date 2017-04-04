#!/bin/bash


echo "apache tomcat 설치를 시작합니다"
echo "1.설치, 2.취소"
select yn in "Yes" "No" ; do
	case $yn in

Yes) 

#톰켓설치

cd /usr/local

wget http://mirror.apache-kr.org/tomcat/tomcat-8/v8.5.13/bin/apache-tomcat-8.5.13.tar.gz

tar xzf apache-tomcat-8.5.13.tar.gz



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

No) echo "설치를 취소했습니다."

 ;;
esac
exit
done































#sh /usr/local/apache-tomcat-8.5.13/bin/startup.sh
####################################################

#echo "#dont remove chkconfig" >> /root/semi/tomcat8
#echo "#chkconfig: 2345 95 20" >> /root/semi/tomcat8
#echo "CATALINA_HOME=/usr/share/tomcat8/apache-tomcat-8.5.13; export CATALINA_HOME" >> /root/semi/tomcat8
#echo "JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64; export JAVA_HOME" >> /root/semi/tomcat8
#echo "start() {" >> /root/semi/tomcat8
#echo "echo -n \"starting Tomcat: \"" >> /root/semi/tomcat8
#echo "\$CATALINA_HOME/bin/startup.sh" >> /root/semi/tomcat8
#echo "}" >> /root/semi/tomcat8
#echo "stop() {" >> /root/semi/tomcat8
#echo "echo -n \"stopping Tomcat: \"" >> /root/semi/tomcat8
#echo "\$CATALINA_HOME/bin/shutdown.sh" >> /root/semi/tomcat8
#echo "}" >> /root/semi/tomcat8
#echo "case \"\$1\" in" >> /root/semi/tomcat8
#echo "start)" >> /root/semi/tomcat8
#echo "start" >> /root/semi/tomcat8
#echo ";;" >> /root/semi/tomcat8
#echo "stop)" >> /root/semi/tomcat8
#echo "stop" >> /root/semi/tomcat8
#echo ";;" >> /root/semi/tomcat8
#echo "restart)" >> /root/semi/tomcat8
#echo "stop" >> /root/semi/tomcat8
#echo "start" >> /root/semi/tomcat8
#echo ";;" >> /root/semi/tomcat8
#echo "*)" >> /root/semi/tomcat8
#echo "echo \$\"Usage: tomcat {start|stop|restart}\"" >> /root/semi/tomcat8
#echo "exit" >> /root/semi/tomcat8
#echo "esac" >> /root/semi/tomcat8

##############################################

#chmod 555 /root/semi/tomcat8









