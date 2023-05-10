FROM ghcr.io/sammcgeown/codestream-ci:latest
LABEL maintainer="smcgeown@vmware.com"

COPY yum/ /etc/yum.repos.d/

ENV HELM_VER=3.11.3

# Install kubectl, jq and yq
RUN     rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
        yum install -y jq kubectl awscli azure-cli google-cloud-cli && \
        wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64  -O /usr/local/bin/yq && chmod +x /usr/local/bin/yq && \
        wget -q https://get.helm.sh/helm-v${HELM_VER}-linux-amd64.tar.gz && \
        tar -zxvf helm-v${HELM_VER}-linux-amd64.tar.gz && \
        mv -f linux-amd64/helm /usr/local/bin/helm && \
        yum clean all