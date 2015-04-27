# Use ubuntu:precise as base image, ubuntu 12.04
FROM ubuntu:precise

MAINTAINER Wilson Mok <wilson@infrequent.co>

# Set environment variables.
ENV HOME /root

# Install dependencies [phase 1]
RUN apt-add-repository -y ppa:archiveteam/wget-lua && apt-get update
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y libssl-dev libcurl4-gnutls-dev git-core libgnutls-dev lua5.1 liblua5.1-0 liblua5.1-0-dev screen python-dev python-pip bzip2 zlib1g-dev make curl wget-lua unzip wget

# Fix dnsmasq bug (see https://github.com/nicolasff/docker-cassandra/issues/8#issuecomment-36922132)
RUN echo 'user=root' >> /etc/dnsmasq.conf

# Setup system for the archiveteam autoscript
RUN adduser --system --group --shell /bin/bash archiveteam

# Install dependencies [phase 2]
RUN pip install seesaw
RUN pip install seesaw requests
RUN pip install --upgrade seesaw requests

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*