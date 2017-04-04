#!/bin/bash

echo "apache tomcat 삭제를 시작합니다"
echo "1.삭제, 2.취소"
select yn in "Yes" "No" ; do
	case $yn in
Yes)

#톰켓삭제

#rm -rf /usr/local/apache-tomcat*

sed -i '/apache-tomcat-8.5.13/d' /etc/crontab

;;

No) echo "삭제를 취소했습니다."
;;
esac
exit
done




