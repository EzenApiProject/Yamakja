FROM tomcat:9-jre11
RUN rm -rf /usr/local/tomcat/webapps/ROOT.war
COPY ./target/shop-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh","run"]