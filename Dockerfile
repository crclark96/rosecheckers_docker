FROM ubuntu

RUN apt update && \
    apt install -y \
        git \
        libtool \
        libboost-all-dev \
        g++ \
        m4 \
        flex \
        bison \
        automake
        

WORKDIR /usr/src

RUN git clone https://github.com/rose-compiler/rose

WORKDIR /usr/src/rose
    
RUN ./build

RUN mkdir /usr/src/rose_build

ENV ROSE_BLD=/usr/src/rose_build

WORKDIR /usr/src/rose_build

ENV ROSE_SRC=/usr/src/rose \
    BOOST_ROOT=/usr \
    LD_LIBRARY_PATH=$BOOST_ROOT/include/boost/lib:$LD_LIBRARY_PATH
    
#RUN $ROSE_SRC/configure --prefix=/usr/local/rose --enable-languages=c,c++ --with-boost=$BOOST_ROOT

CMD ['/bin/bash']