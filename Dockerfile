FROM ubuntu:16.04
MAINTAINER Sreekanth G S <mail@sreekanth.in>

RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get install -y bitcoind
    
RUN bitcoind --help

VOLUME ["/opt/bitcoin"]

EXPOSE 8332
EXPOSE 8333
EXPOSE 18332
EXPOSE 18333

CMD ["/usr/bin/bitcoind", "--conf=/opt/bitcoin/bitcoind.conf", "--printtoconsole"]
