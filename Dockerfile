FROM java:8

EXPOSE 9096

ARG JAR_FILE=demo-0.0.1-SNAPSHOT.jar

ADD ${JAR_FILE} demo-0.0.1-SNAPSHOT.jar

CMD [ "java","-jar","demo-0.0.1-SNAPSHOT.jar" ]