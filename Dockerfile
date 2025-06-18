# Use Tomcat 9 with JDK 17
FROM tomcat:9.0-jdk17-openjdk

# Clear default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Set working directory for source code
WORKDIR /usr/src/app

# Copy Java source files into container
COPY src/ src/

# Create output directory for compiled classes
RUN mkdir -p WEB-INF/classes

# Compile the servlet Java files
RUN javac -cp /usr/local/tomcat/lib/servlet-api.jar -d WEB-INF/classes src/com/example/*.java

# Create final app structure in Tomcat webapps
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Copy compiled classes
RUN cp -r WEB-INF/classes/* /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

# Copy JSP and web.xml
COPY index.jsp /usr/local/tomcat/webapps/ROOT/
COPY WEB-INF/web.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/

EXPOSE 8080
