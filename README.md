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

**********************************************************************



*****************************************************************
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


***********************************************************************
CopyLeft by Dowon Koo, Sangwoo Moon, Oksu Park, Inseop Lee  4 April, 2017
