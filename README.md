# scs
[![ci](https://github.com/otisnado/scs/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/otisnado/scs/actions/workflows/docker-image.yml)

Spring Config Server is a tool to make more easer the configuration management for application/services using HTTP protocol and API REST.
SCS required three env vairiables to start

- SCS_GIT_REPOSITORY: Git URI repository
- SCS_GIT_USERNAME: Git username to authenticate with git repository
- SCS_GIT_PASSWORD: Password to authenticate with git username against git repository

### Run locally Spring Config Server
```
mvn spring-boot:run
```

SCS has basic authentication enabled, a password is generated when scs is started.

Default credentials for basic authentication

- Username: user
- Password: generated password at start

## Container image

A container image is store in 'otisnado/scs:tag' Docker Hub repository. To run container is required set the required environment variables (SCS_GIT_REPOSITORY, SCS_GIT_USERNAME, SCS_GIT_PASSWORD).

```
docker run -d -p 8080:8080 -e SCS_GIT_REPOSITORY=$SCS_GIT_REPOSITORY -e SCS_GIT_USERNAME=$SCS_GIT_USERNAME -e SCS_GIT_PASSWORD=$SCS_GIT_PASSWORD otisnado/scs:tag
```

### Checklist

- [x] Run SCS in container
- [x] Basic authentication
- [ ] Authentication providers
- [ ] Helm chart to deploy on k8s
- [ ] CI/CD pipelines

