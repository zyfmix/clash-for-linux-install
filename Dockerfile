# Registry: registry.cn-hangzhou.aliyuncs.com/coam/zs-clash:v2.0.0
FROM --platform=$BUILDPLATFORM proxy.icsay.com/library/ubuntu:24.04

MAINTAINER Cor Ethan <zyf@iirii.com>

ARG TARGETOS
ARG TARGETARCH

ENV HOME /app

WORKDIR /app

COPY . /app

