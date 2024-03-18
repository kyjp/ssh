FROM debian:latest

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root123' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN apt-get upgrade
RUN apt-get install -y bash \
    curl \
    git \
    make
RUN git clone https://github.com/git-ftp/git-ftp.git /opt/git-ftp \
  && cd /opt/git-ftp \
  && tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)" \
  && git checkout "$tag" \
  && make install \
  && rm -rf /opt/git-ftp

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
