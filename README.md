# LinuxSemi
 This is Linux Semi Project with inseop, sangwoo, dowon 
 There is practice for shell script language

***************************************************************
***주의사항******    ******************************************
Github Project 내에는 Disk1 폴더를 포함하고 있지 않다. 
Oracle 11g XE 가 wget으로 다운로드가 불가능하게 되었다. oracle.com 홈페이지를 통하여 
oracle11g.npm.zip 파일을 다운로드 후 압축 풀면 Disk1 폴더 내에 파일들이 위치하고 있고, Disk1 폴더를 LinuxSemi 폴더내에 같이 위치 시키면 된다.
***************************************************************


통합 개발환경 설치 

./ENV.sh

명령을 이용하여 NodeJS, ReactJS, tomcat 8.5, Oracle XE 11g 를 한 번에 설치 할 수 있다.


*****************************삭제를 원할 시에는 **********************

./VNE.sh
명령을 이용하면 NodeJS, ReactJS, tomcat 8.5, Oracle XE 11g 를 한 번에 삭제 할 수 있다.

*************************************************************



=================개별 설치/삭제  방법==========================
  

*nodeJS 설치와 react_project 폴더를 만들어 기본 reactJS 설정 하는 것만을 원하면

./React_setup.sh

명령을 사용하여 설치 할 수 있다. ( 삭제는 ./React_uninstall.sh )


*tomcat 설치를 원하면 

./semitomcat.sh

명령을 사용하여 설치 할 수 있다. (삭제는 /semitomcat_uninstall.sh )


*Oracle XE 11g 설치/삭제 를 원하면

./oracleInstall.sh

명령을 사용하여 설치/삭제 할 수 있다.
***************************************************
각각 설치 되었는지 설치 확인 방법

1. Oracle 설치 확인방법 
 	$cd / : 에서 u01 폴더가 있는지 확인한다.
	$sqlplus : 실행시 username,password 입력후 실행하면 확인할 수 있다.

2. Tomcat 설치 확인방법
	$ls /usr/local/tomcat/8.5.13 폴더가 있는지 확인한다.
	$vi /etc/crontab  tomcat관련 문구가 작성되었는지 확인한다.
	http://localhost:8090 에 tomcat 홈페이지가 뜨는지 확인한다.

3. NodeJS 설치 확인 방법
	$node --verison 명령을 쳤을때 NodeJS 버전이 나오면 성공

4. ReactJS 설치 확인 방법
	$cd react_project 명령으로 react_project 폴더에 들어가서
	$npm run dev-server 명령을 실행하고, 
	http://localhost:4000 을 실행하였을 때, Hello Yangssem 이 나오면 성공
	

***********************************************************************
CopyLeft by Dowon Koo, Sangwoo Moon, Oksu Park, Inseop Lee  4 April, 2017
