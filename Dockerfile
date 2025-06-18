FROM tomcat:9.0-jdk17-openjdk

RUN rm -rf /usr/local/tomcat/webapps/*

# Build servlets
WORKDIR /usr/src/app
COPY src/ src/
RUN mkdir -p /usr/src/app/WEB-INF/classes
RUN javac -cp /usr/local/tomcat/lib/servlet-api.jar -d WEB-INF/classes src/com/example/*.java

# Copy web files
COPY index/ /usr/local/tomcat/webapps/ROOT/
COPY WEB-INF/web.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/

EXPOSE 8080
