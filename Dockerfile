FROM openjdk:23-bookworm

COPY target/demo-0.0.1-SNAPSHOT.jar .
EXPOSE 8080
CMD /usr/local/openjdk-23/bin/java -jar /demo-0.0.1-SNAPSHOT.jar
