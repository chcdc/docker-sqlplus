FROM ubuntu

RUN apt-get update
RUN apt-get --no-install-recommends -y install libaio1 unzip rlwrap apt-utils

ADD instantclient-basic-linux.x64-11.2.0.3.0.zip /
ADD instantclient-sqlplus-linux.x64-11.2.0.3.0.zip /
ADD instantclient-sdk-linux.x64-11.2.0.3.0.zip /
ADD instantclient-jdbc-linux.x64-11.2.0.3.0.zip /

RUN unzip instantclient-basic-linux.x64-11.2.0.3.0.zip && rm instantclient-basic-linux.x64-11.2.0.3.0.zip
RUN unzip instantclient-sqlplus-linux.x64-11.2.0.3.0.zip && rm instantclient-sqlplus-linux.x64-11.2.0.3.0.zip
RUN unzip instantclient-sdk-linux.x64-11.2.0.3.0.zip && rm instantclient-sdk-linux.x64-11.2.0.3.0.zip
RUN unzip instantclient-jdbc-linux.x64-11.2.0.3.0.zip && rm instantclient-jdbc-linux.x64-11.2.0.3.0.zip

ENV LD_LIBRARY_PATH /instantclient_11_2
ENV ORACLE_HOME=/instantclient_11_2/
ENV ORACLE_SID=harnbuild

# CMD /instantclient_11_2/sqlplus <user>/<password>@//xxx.yyy.eu-west-1.rds.amazonaws.com:1521/ORCL
CMD sleep 1; rlwrap /instantclient_11_2/sqlplus "/ as sysdba" $URL
