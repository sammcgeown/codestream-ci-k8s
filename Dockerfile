FROM sammcgeown/codestream-ci:latest
LABEL maintainer="smcgeown@vmware.com"

COPY kubernetes.repo /etc/yum.repos.d/

# Install kubectl, jq and yq
RUN     yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
        yum install -y jq kubectl && \
        wget https://github.com/mikefarah/yq/releases/download/3.3.2/yq_linux_amd64 && \
        mv yq_linux_amd64 /usr/local/bin/yq && \
        chmod +x /usr/local/bin/yq