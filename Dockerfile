FROM maven:3.9.5-eclipse-temurin-17
WORKDIR /opt/hilel14
COPY pom.xml ./
RUN mvn dependency:resolve
COPY src ./src
RUN mvn --batch-mode package
ENTRYPOINT ["java", "-jar"]
CMD ["hello-1.0.0.jar"]