# CircleCI Maven Cache images

The objective of this repository is to provide custom Docker images that are based on the official CircleCI images.
They are used to speed up the build process by providing a pre-warmed maven cache.

These images will be rebuilt at regular interval and aim at being used by any of our jobs that would need access to maven artifacts.

## Repo:tag format

To simplify management, images will be following this naming convention.

| CircleCI Image repo:tag | Jahia Image repo:tag |
|---|---|
| cimg/openjdk:8.0.275 | jahia/cimg-mvn-cache:cimg_openjdk_8.0.275

The images are updated when changes are pushed to the repository or nightly.

## Accessing the images

Images are being pushed to https://hub.docker.com/repository/docker/jahia/cimg-mvn-cache

## JDK Support

the `matrix` strategy is used to build images for multiple JDK versions. The [following](.github/workflows/build-and-push.yml#L13-L16) JDK versions are supported:
``` 
    strategy:
      matrix:
        jdk_version: [11.0.20, 17.0.9]
 ```

