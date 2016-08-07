FROM java:8-jre-alpine
MAINTAINER Patricio A. Pérez Valverde <pperez@boaboa.org>

ENV WIREMOCK_VERSION 2.1.9

RUN apk update && apk add ca-certificates openssl && update-ca-certificates
RUN wget -q https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/${WIREMOCK_VERSION}/wiremock-standalone-$WIREMOCK_VERSION.jar

VOLUME /data
WORKDIR /data
EXPOSE 8080 8081

CMD java -jar /wiremock-standalone-$WIREMOCK_VERSION.jar $WIREMOCK_ARGS
