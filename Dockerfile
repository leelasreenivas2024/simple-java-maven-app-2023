FROM maven AS build
MAINTAINER "phani"
COPY . .
RUN mvn clean install package

FROM tomcat
COPY --from=build /webapp/target/webapp.war /usr/local/tomcat/webapps
