FROM openjdk:16.0.2
COPY target/barber-1.0-SNAPSHOT.jar barber-1.0-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "barber-1.0-SNAPSHOT.jar"]