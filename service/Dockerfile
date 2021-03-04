FROM maven:3.6.0-jdk-8-slim
COPY . /app
WORKDIR /app/takehome
RUN mvn package
WORKDIR /app/takehome/target
RUN cp *.jar ./app.jar
EXPOSE 80
CMD ["java", "-jar", "app.jar"]