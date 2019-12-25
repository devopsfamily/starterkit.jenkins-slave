FROM jenkinsci/jnlp-slave:latest

USER root

RUN apt-get update && \
    apt-get install -qq -y --no-install-recommends \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" && \
    add-apt-repository "deb [arch=amd64] http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main"  && \
    apt-get update && \
    apt-get install -qq -y --no-install-recommends docker-ce ansible && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
