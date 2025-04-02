# Registry: registry.cn-hangzhou.aliyuncs.com/coam/zs-clash:v2.0.0
FROM --platform=$BUILDPLATFORM proxy.icsay.com/library/ubuntu:24.04

MAINTAINER Cor Ethan <zyf@iirii.com>

ARG TARGETOS
ARG TARGETARCH

ENV HOME /app

ENV TZ=Asia/Shanghai

WORKDIR /app

COPY . /app

# after ubuntu 24.04
# [Ubuntu 软件仓库](https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/)
RUN cp /etc/apt/sources.list.d/ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources.bak && \
    sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.cloud.tencent.com/g' /etc/apt/sources.list.d/ubuntu.sources && \
    sed -i 's/http:\/\/security.ubuntu.com/http:\/\/mirrors.cloud.tencent.com/g' /etc/apt/sources.list.d/ubuntu.sources

RUN apt update -y && apt install -y --no-install-recommends curl ca-certificates net-tools lsb-release locales tzdata && rm -rf /var/lib/apt/lists/*
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
RUN localedef -c -f UTF-8 -i en_US en_US.UTF-8 && locale -a && echo 'export LANG="zh_CN.UTF-8"' >> /etc/profile

RUN apt update -y && apt install -y --no-install-recommends systemd sudo iproute2 xz-utils

#RUN wget https://github.com/MetaCubeX/mihomo/releases/download/v1.19.2/mihomo-linux-amd64-compatible-v1.19.2.gz

#SHELL ["/bin/bash", "-c"]
#RUN install -D -m +x <(gzip -dc /app/resources/zip/mihomo-linux-amd64-compatible-v1.19.2.gz) "/usr/local/bin/mihomo"
RUN ["/bin/bash", "-c", "install -D -m +x <(gzip -dc /app/resources/zip/mihomo-linux-amd64-compatible-v1.19.2.gz) /usr/local/bin/mihomo"]

#RUN cp mihomo /usr/local/bin
#RUN cp config.yaml /etc/mihomo
# RUN /usr/local/bin/mihomo -d /etc/mihomo

# docker run --rm --name clash-test -it proxy.icsay.com/metacubex/mihomo:v1.19.3 /bin/bash