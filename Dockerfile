FROM ghcr.io/sammcgeown/codestream-ci:latest
LABEL maintainer="smcgeown@vmware.com"

COPY kubernetes.repo /etc/yum.repos.d/

ENV HELM_VER=3.11.3

# Install kubectl, jq and yq
RUN     yum install -y jq kubectl && \
        wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64  -O /usr/local/bin/yq && chmod +x /usr/local/bin/yq && \
        wget -q https://get.helm.sh/helm-v${HELM_VER}-linux-amd64.tar.gz && \
        tar -zxvf helm-v${HELM_VER}-linux-amd64.tar.gz && \
        mv -f linux-amd64/helm /usr/local/bin/helm