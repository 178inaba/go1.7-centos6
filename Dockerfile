FROM centos:6
MAINTAINER 178inaba <178inaba@users.noreply.github.com>

# Install supervisor and wget git dependent packages.
RUN yum -y install epel-release && yum -y update && \
    yum -y install curl-devel expat-devel gcc gettext-devel openssh-clients openssl-devel perl-ExtUtils-MakeMaker supervisor wget && \
    yum clean all

# Install git.
ENV GIT_VER 2.10.0
RUN wget https://www.kernel.org/pub/software/scm/git/git-$GIT_VER.tar.gz && \
    tar -zxf git-$GIT_VER.tar.gz && \
    rm -rf git-$GIT_VER.tar.gz && \
    cd git-$GIT_VER && \
    make prefix=/usr/local all && \
    make prefix=/usr/local install && \
    cd .. && \
    rm -rf git-$GIT_VER

# Install golang.
RUN wget https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.7.1.linux-amd64.tar.gz && \
    rm -v go1.7.1.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin
