FROM tomcat:9.0-jdk17-openjdk

# Clear default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy all files and folders in the repo to the webapps/StudentCRUDApp folder
COPY . /usr/local/tomcat/webapps/ROOT

