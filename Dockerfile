FROM tomcat:9.0-jdk17-openjdk

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR or project folder into Tomcat
COPY StudentCRUDApp /usr/local/tomcat/webapps/StudentCRUDApp


EXPOSE 8080

CMD ["catalina.sh", "run"]
