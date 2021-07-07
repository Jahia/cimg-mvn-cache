# CircleCI Maven Cache images 

The objective of this repository is to warmup CircleCI maven cache by fetching the most common Jahia dependencies. 

These images will be rebuilt at regular interval and aim at being used by any of our jobs that would need access to maven artifacts.

## Repo:tag format

To simplify management, images will be following this naming convention.


| CircleCI Image repo:tag | Jahia Image repo:tag |
|---|---|
| cimg/openjdk:8.0.275 | jahia/cimg-mvn-cache:cimg_openjdk_8.0.275


