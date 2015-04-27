# Use phusion/baseimage as base image.
FROM phusion/baseimage:0.9.5

MAINTAINER Wilson Mok <wilson@infrequent.co>

# Set environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install dependencies
RUN apt-get install -y python-pip git pciutils sudo net-tools isc-dhcp-client python-software-properties wget
RUN apt-add-repository -y ppa:archiveteam/wget-lua && apt-get update
RUN apt-get install -y wget-lua

# Install script dependencies [phase 1]
RUN apt-get install -y libssl-dev libcurl4-gnutls-dev git-core libgnutls-dev lua5.1 liblua5.1-0 liblua5.1-0-dev screen python-dev python-pip bzip2 zlib1g-dev make curl

# Fix dnsmasq bug (see https://github.com/nicolasff/docker-cassandra/issues/8#issuecomment-36922132)
RUN echo 'user=root' >> /etc/dnsmasq.conf

# Setup system for the archiveteam autoscript
RUN useradd archiveteam
RUN echo "archiveteam ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN mkdir /home/archiveteam && chown archiveteam: /home/archiveteam

# Install script dependencies [phase 2]
RUN apt-get install -y git-core libgnutls-dev lua5.1 liblua5.1-0 liblua5.1-0-dev screen python-dev python-pip bzip2 zlib1g-dev
RUN pip install seesaw
RUN pip install seesaw requests

# Expose web interface port
EXPOSE 8001

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
