FROM oraclelinux:7-slim
EXPOSE 8080
RUN yum-config-manager --add-repo=http://yum.oracle.com/repo/OracleLinux/OL7/oracle/software/x86_64
RUN yum upgrade -y
# RUN yum update && yum upgrade
RUN yum install ords -y
USER oracle
RUN cd /opt/oracle && mkdir network/admin -p
COPY ./tnsnames.ora /opt/oracle/network/admin
USER root
COPY ./jdk-11.0.17_linux-x64_bin.rpm /tmp
RUN rpm -ivh /tmp/jdk-11*.rpm
RUN chown -R oracle:oinstall /opt/oracle
COPY ./config_ords.sh /root

RUN chmod +x /root/*.sh
WORKDIR /root
RUN  pwd
RUN /bin/bash -c './config_ords.sh'
RUN  pwd
#RUN mv ./databases/db1 ./databases/default


ENTRYPOINT ords --config /etc/ords/config serve &> /tmp/ords_xe.log
