# Use the latest CentOS image as the base
FROM centos:latest

RUN yum -y update && \
    yum -y install curl

# Clean up the cache to reduce image size
RUN yum clean all

# Install Python 3
RUN yum -y install python3

# Install pip for Python 3
RUN yum -y install python3-pip



# Install MongoDB Atlas CLI following the official MongoDB instructions
RUN curl -sL https://info-mongodb-com.s3.amazonaws.com/mongodb-cli/mongocli/stable/mongocli-stable-linux_x86_64.rpm -o mongocli.rpm && \
    yum -y install mongocli.rpm && \
    rm -f mongocli.rpm

# Verify installations
RUN python3 --version && \
    pip3 --version && \
    mongocli version
