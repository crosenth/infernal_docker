# http://eddylab.org/
# docker build --tag infernal:1.1.5 .
FROM ubuntu:24.04

RUN BUILD_DEPS='build-essential wget' WORKDIR='/usr/src/infernal' \
    && apt-get update \
    && apt-get install -y $BUILD_DEPS --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && wget -q http://eddylab.org/infernal/infernal-1.1.5.tar.gz \
    && mkdir -p $WORKDIR \
    && tar xzf infernal-1.1.5.tar.gz -C $WORKDIR --strip-components=1 \
    && rm infernal-1.1.5.tar.gz \
    && cd $WORKDIR \
    && ./configure \
    && make \
    && make install \
    && make -C hmmer \
    && make -C hmmer install \
    && make -C easel \
    && make -C easel install \
    && cd / \
    && rm -r $WORKDIR \
    && apt-get purge -y --auto-remove $BUILD_DEPS
