FROM centos:7

ENV HOME /root

COPY etc/papertrail-bundle.pem /etc/papertrail-bundle.pem
COPY etc/profile.d/lts.sh /etc/profile.d/lts.sh
COPY etc/profile.d/nss-sdb-cache.sh /etc/profile.d/nss-sdb-cache.sh

RUN \
  ln -sf /usr/share/zoneinfo/Australia/Brisbane /etc/localtime && \
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm && \
  sed -i "s/metalink/#metalink/" /etc/yum.repos.d/epel.repo && \
  sed -i "s/#baseurl/baseurl/" /etc/yum.repos.d/epel.repo && \
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
  pip install awscli
