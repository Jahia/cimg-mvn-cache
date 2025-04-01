ARG CCI_SRC_IMAGE=cimg/openjdk:8.0.312-node

FROM $CCI_SRC_IMAGE

USER root

ADD maven.settings.xml .

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=ssh git clone git@github.com:Jahia/jahia-private.git; \
    cd jahia-private;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_2_1_0 JAHIA_8_2_1_0;\
    mvn -B -s ../maven.settings.xml dependency:resolve
    git checkout -b JAHIA_8_2_0_7 JAHIA_8_2_0_7;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_1_8_2 JAHIA_8_1_8_2;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_1_7_2 JAHIA_8_1_7_2;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    git checkout -b JAHIA_8_1_6_2 JAHIA_8_1_6_2;\
    mvn -B -s ../maven.settings.xml dependency:resolve;\
    cd ..; rm -Rf jahia-private

RUN mv /root/.m2 /home/circleci/; \
    chown -R circleci:circleci /home/circleci/.m2

USER circleci
