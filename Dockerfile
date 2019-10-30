FROM centos:7

ENV HOME /root

COPY etc/papertrail-bundle.pem /etc/papertrail-bundle.pem
COPY etc/profile.d/lts.sh /etc/profile.d/lts.sh
COPY etc/profile.d/nss-sdb-cache.sh /etc/profile.d/nss-sdb-cache.sh
COPY ssm-session /usr/bin/ssm-session

RUN \
  chmod 755 /usr/bin/ssm-session && \
  ln -sf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime && \
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
  rpm -Uvh https://repo.ius.io/ius-release-el7.rpm
  

RUN \
  yum update -y && \
  yum install -y \
    python36-pip \
    hostname \
    inotify-tools \
    wget \
    tar \
    unzip \
    nano \
    which \
    groff \
    jq && \
  yum clean all && \
  pip3 install supervisor && \
  pip3 install awscli && \
  ln -s /usr/local/bin/aws /usr/bin/aws && \
  rpm -ivh "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm"
