ARG FROM_IMAGE=cimg/openjdk:8.0.312-node

FROM $FROM_IMAGE
ARG GITHUB_API_TOKEN

RUN git clone https://$GITHUB_API_TOKEN@github.com/Jahia/jahia-private.git; \
    cd jahia-private;\
    mvn clean install;\
    git checkout -b JAHIA_8_0_3_0 JAHIA_8_0_3_0;\
    mvn clean install;\
    git checkout -b JAHIA_7_3_9_0 JAHIA_7_3_9_0;\
    mvn clean install;\
    git checkout -b JAHIA_7_3_8_0 JAHIA_7_3_8_0;\
    mvn clean install;\
    cd ..; rm -Rf jahia-private

