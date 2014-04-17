FROM centos
RUN yum -y install wget tar
EXPOSE 8080
RUN [ -d /opt ] || mkdir /opt
ADD apache-tomcat-7.0.53.tar.gz /opt
ADD jdk-7u55-linux-x64.tar.gz /opt
ENV JAVA_HOME /opt/jdk1.7.0_55 
ENV JRE_HOME /opt/jdk1.7.0_55/jre
ENV PATH $PATH:$JAVA_HOME/bin:$JRE_HOME/bin
ENV CATALINA_HOME /opt/apache-tomcat-7.0.53
#ENV CATALINA_OPTS="-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses"
RUN echo "CATALINA_OPTS=\"$CATALINA_OPTS\"" > /opt/apache-tomcat-7.0.53/bin/setenv.sh
#RUN chmod 777 /opt/apache-tomcat-7.0.53/bin/setenv.sh
#VOLUME ["/opt/apache-tomcat-7.0.53/logs"]
#VOLUME ["/opt/apache-tomcat-7.0.53/work"]
#ENTRYPOINT ["/opt/apache-tomcat-7.0.53/bin/catalina.sh", "run"]
CMD ["/opt/apache-tomcat-7.0.53/bin/catalina.sh", "run"]
#CMD ["/opt/apache-tomcat-7.0.53/bin/startup.sh"]

