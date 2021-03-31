FROM sammcgeown/codestream-ci:latest
LABEL maintainer="smcgeown@vmware.com"

COPY kubernetes.repo /etc/yum.repos.d/

ENV HELM_VER=3.5.3

# Install kubectl, jq and yq
RUN     yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
        yum install -y jq kubectl && \
        wget https://github.com/mikefarah/yq/releases/download/3.3.2/yq_linux_amd64 && \
        mv yq_linux_amd64 /usr/local/bin/yq && \
        chmod +x /usr/local/bin/yq && \
        wget -q https://get.helm.sh/helm-v${HELM_VER}-linux-amd64.tar.gz && \
        tar -zxvf helm-v${HELM_VER}-linux-amd64.tar.gz && \
        mv -f linux-amd64/helm /usr/local/bin/helm