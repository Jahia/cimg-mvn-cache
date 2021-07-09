ARG FROM_IMAGE=cimg/openjdk:8.0.275

FROM $FROM_IMAGE

RUN git clone --depth 1 https://github.com/Jahia/jahia.git; \
  cd jahia ;\
  mvn dependency:go-offline ;\
  cd ..; rm -Rf jahia
RUN git clone --depth 1 https://github.com/Jahia/graphql-core.git; \
  cd graphql-core ;\
  mvn dependency:go-offline ;\
  cd ..; rm -Rf graphql-core

COPY maven.settings.xml /home/jahians/.m2/settings.xml
