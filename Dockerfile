FROM ubuntu:latest
MAINTAINER TuVM

# Make sure the package repository is up to date.
# RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    openssh-server \
    openjdk-8-jdk \
	git \
	docker.io \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd

# Add user jenkins to the image
RUN adduser --quiet jenkins
# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]