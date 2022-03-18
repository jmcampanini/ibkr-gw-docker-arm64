FROM alpine:3.15.1

ENV \
    GATEWAY_PATH="/opt/clientportal" \
    JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk" \
    PATH="$JAVA_HOME/bin:$PATH"

RUN apk add --update --no-cache \
    bash \
    curl \
    openjdk8-jre-base && \
    rm -rf /var/cache/apk/*

RUN \
    mkdir -p $GATEWAY_PATH && \
    cd $GATEWAY_PATH && \
    wget -O clientportal.zip https://download2.interactivebrokers.com/portal/clientportal.gw.zip && \
    unzip clientportal.zip && \
    rm -rf clientportal.zip && \
    rm -rf root/webapps/demo

ADD overrides/root/conf.yaml $GATEWAY_PATH/root/conf.yaml
ADD overrides/root/logback.xml $GATEWAY_PATH/root/logback.xml
ADD overrides/bin/run.sh $GATEWAY_PATH/bin/run.sh

EXPOSE 5000/tcp

WORKDIR $GATEWAY_PATH
CMD ["bin/run.sh", "root/conf.yaml"]
