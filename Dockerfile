ARG CCI_SRC_IMAGE=cimg/openjdk:8.0.312-node

FROM $CCI_SRC_IMAGE

USER root

ADD maven.settings.xml .

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh git clone git@github.com:Jahia/jahia-private.git; \
    cd jahia-private;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_2_0_6 JAHIA_8_2_0_6;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_1_6_0 JAHIA_8_1_6_0;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_1_5_1 JAHIA_8_1_5_1;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_1_3_1 JAHIA_8_1_3_1;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_1_2_3 JAHIA_8_1_2_3;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_1_0_0 JAHIA_8_1_0_0;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_0_3_0 JAHIA_8_0_3_0;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_7_3_10_0 JAHIA_7_3_10_0;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    cd ..; rm -Rf jahia-private

RUN mv /root/.m2 /home/circleci/; \
    chown -R circleci:circleci /home/circleci/.m2

USER circleci
