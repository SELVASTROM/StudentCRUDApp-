FROM tomcat:9.0-jdk17-openjdk

# Clear Tomcat default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Set working directory
WORKDIR /usr/src/app

# Copy and compile Java source
COPY src/ src/
RUN mkdir -p WEB-INF/classes && \
    javac -cp /usr/local/tomcat/lib/servlet-api.jar -d WEB-INF/classes src/com/example/*.java

# Prepare app structure in ROOT
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes && \
    cp -r WEB-INF/classes/* /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# Copy JSP and web.xml
COPY index.jsp /usr/local/tomcat/webapps/ROOT/
COPY WEB-INF/web.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/

# Copy MySQL JDBC driver to Tomcat's lib folder
COPY WEB-INF/lib/mysql-connector-j-8.4.0.jar /usr/local/tomcat/lib/


EXPOSE 8080
