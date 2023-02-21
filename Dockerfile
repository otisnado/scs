FROM alpine:latest AS build

# Installing dependencies in build stage
RUN apk update && \
    apk add openjdk17 && \
    apk add maven

# Args required to build SCS container image
ARG GIT_REPOSITORY
ARG GIT_USERNAME
ARG GIT_PASSWORD

# Env required to run SCS
ENV SCS_GIT_REPOSITORY=$GIT_REPOSITORY
ENV SCS_GIT_USERNAME=$GIT_USERNAME
ENV SCS_GIT_PASSWORD=$GIT_PASSWORD

# Setting up source code directory
WORKDIR /src

# Copying source code to WORKDIR
COPY . .

# Building SCS using maven
RUN mvn clean install package

# Final container image
FROM openjdk:17-jdk-alpine

# Default port to expose
EXPOSE 8080

# Creating rootless user
RUN adduser -D app

# Setting up workdir
WORKDIR /home/app

# Copying .jar file to runtime stage
COPY --from=build /src/target/*.jar .

# Entrypoint to run container
ENTRYPOINT [ "java", "-jar", "~/scs.jar" ]