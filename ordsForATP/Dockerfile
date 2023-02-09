FROM oraclelinux:7-slim
EXPOSE 8080
RUN yum-config-manager --add-repo=http://yum.oracle.com/repo/OracleLinux/OL7/oracle/software/x86_64
RUN yum upgrade && yum update
RUN yum update && yum upgrade
RUN yum install ords -y
USER oracle
COPY ./Wallet*.zip /tmp
USER root
COPY ./jdk-11.0.17_linux-x64_bin.rpm /tmp
RUN rpm -ivh /tmp/jdk-11*.rpm
WORKDIR /root
COPY ./config_ords.sh .
RUN bash -e config_ords.sh ${custom_ords_public_user_pwd} ${tns_names}
RUN chown -R oracle:oinstall /opt/oracle

ENTRYPOINT cd /opt/oracle/ords/config/ords && \
           ords serve
