FROM ubuntu:latest
MAINTAINER TuVM

# Make sure the package repository is up to date.
# RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
# Install a basic SSH server
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

# Install JDK 8 (latest edition)
RUN apt-get install -y --no-install-recommends openjdk-8-jdk

# Install packages needed for the build
RUN apt-get install -y --no-install-recommends git maven

# Install Docker from repository
RUN apt-get install -y --no-install-recommends docker.io

# Add user jenkins to the image
RUN adduser --quiet jenkins
# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]