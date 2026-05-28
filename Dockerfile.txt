# Etapa de construcción
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa de ejecución
FROM tomcat:9.0-jdk17-openjdk-slim
# Borramos el contenido por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
# Copiamos nuestro war compilado
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
