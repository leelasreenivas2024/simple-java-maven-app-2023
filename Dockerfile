FROM maven:3.5 AS build
MAINTAINER "phani"
COPY . .
RUN mvn clean install package

FROM tomcat  #add tomact version
COPY --from=build /webapp/target/webapp.war /usr/local/tomcat/webapps
