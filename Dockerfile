FROM maven AS build
MAINTAINER "phani"
COPY . .
RUN mvn clean install

FROM tomcat
COPY --from=build /webapp/target/webapp.war /usr/local/tomcat/webapps
