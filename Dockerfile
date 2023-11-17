FROM maven:3.9.5-eclipse-temurin-17
WORKDIR /opt/hilel14
COPY pom.xml ./
RUN mvn dependency:resolve
COPY src ./src
RUN src/scripts/increment-version.sh
RUN mvn --batch-mode package
