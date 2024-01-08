# Use the latest CentOS image as the base
FROM centos:latest

# Clean up the cache to reduce image size
RUN yum clean all

# Update the package manager and install Python 3
RUN yum -y update && \
    yum -y install python3

# Install pip for Python 3
RUN yum -y install python3-pip


# Download and install MongoDB Atlas CLI
RUN curl -O https://downloads.mongodb.com/atlas-cli/mongodb-atlas-latest.linux_x86_64.tar.gz && \
    tar -zxvf mongodb-atlas-latest.linux_x86_64.tar.gz && \
    mv mongodb-atlas-latest/bin/mongocli /usr/local/bin/mongocli && \
    rm -rf mongodb-atlas-latest* && \
    mongocli config set skip_update_check true

# Verify installations
RUN python3 --version && \
    pip3 --version && \
    mongocli version
