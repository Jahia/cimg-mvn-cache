ARG FROM_IMAGE=cimg/openjdk:8.0.275

FROM $FROM_IMAGE

RUN git clone --depth 1 https://github.com/Jahia/jahia.git; \
  cd jahia ;\
  mvn clean install de.qaware.maven:go-offline-maven-plugin:resolve-dependencies ;\
  cd ..; rm -Rf jahia
RUN git clone --depth 1 https://github.com/Jahia/graphql-core.git; \
  cd graphql-core ;\
  mvn clean install de.qaware.maven:go-offline-maven-plugin:resolve-dependencies ;\
  cd ..; rm -Rf graphql-core