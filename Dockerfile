FROM tomcat:8.5.89
COPY target/*.war webapps/app.war
