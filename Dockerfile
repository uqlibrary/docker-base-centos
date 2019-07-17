FROM centos:7.6.1810

ENV HOME /root

COPY etc/papertrail-bundle.pem /etc/papertrail-bundle.pem
COPY etc/profile.d/lts.sh /etc/profile.d/lts.sh
COPY etc/profile.d/nss-sdb-cache.sh /etc/profile.d/nss-sdb-cache.sh
COPY ssm-session /usr/bin/ssm-session

RUN \
  chmod 755 /usr/bin/ssm-session && \
  ln -sf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime && \
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm && \
  rpm -Uvh https://dl.iuscommunity.org/pub/ius/stable/CentOS/7/x86_64/ius-release-1.0-15.ius.centos7.noarch.rpm

RUN \
  yum update -y && \
  yum install -y \
    python-setuptools \
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
  easy_install supervisor && \
  easy_install pip && \
  pip install awscli && \
  rpm -ivh "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm"
