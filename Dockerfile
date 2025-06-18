FROM tomcat:9.0-jdk17-openjdk

# Clean default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy static and compiled files directly into ROOT
COPY index.jsp /usr/local/tomcat/webapps/ROOT/
COPY WEB-INF /usr/local/tomcat/webapps/ROOT/WEB-INF/

EXPOSE 8080
