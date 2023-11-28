FROM maven:3.9.5-eclipse-temurin-17 AS build-env
WORKDIR /opt/hilel14
COPY pom.xml ./
RUN mvn dependency:resolve
COPY src ./src
RUN mvn --batch-mode package 
#RUN mvn --batch-mode deploy

FROM some-jre-image
WORKDIR /opt/hilel14
COPY --from=build-env WORKDIR /opt/hilel14/target/*.jar ./
#USER games
ENTRYPOINT ["java", "-jar"]
CMD ["hello-1.0.0.jar"]
