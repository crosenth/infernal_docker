FROM ubuntu:20.04

WORKDIR /infernal/

RUN apt-get -y -m update && apt-get install -y wget build-essential && rm -rf /var/lib/apt/lists/*

RUN wget -q http://eddylab.org/infernal/infernal-1.1.4.tar.gz && \
  tar xzf infernal-1.1.4.tar.gz && \
  cd infernal-1.1.4 && \
  ./configure && make && make install && cd hmmer && make install && cd ../easel && make install
