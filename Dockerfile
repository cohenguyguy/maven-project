FROM tomcat

ADD ./webapp/target/*.war /usr/local/tomcat/webapps

EXPOSE 8090

CMD ["catalina.sh", "run"]
