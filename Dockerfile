FROM eclipse-temurin:17-jdk-jammy
WORKDIR /opt/hilel14
COPY pom.xml ./
RUN mvn dependency:resolve
COPY src ./src
RUN src/scripts/increment-version.sh
RUN mvn --batch-mode package
