#ubuntu
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# Install any needed packages specified in requirements.txt
RUN apt-get update && dpkg --add-architecture i386

 
RUN apt-get update && \
    apt-get install -y \
    bc \
    git \
    gcc \
    g++ \
    zip \
    unzip \
    make \
    cmake \
    automake \
    wget \
    python \
    python3 \
    python3-pip \
    python3-pexpect \
    libc6-dev-i386 \
    lib32z1 \
    lsb-core \
    lib32ncurses5-dev \
    libncurses5-dev \
    libuuid1:i386 \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    libtool \
    libevdev-dev \
    pkg-config && \
    apt-get clean

RUN cd ~ && git clone https://github.com/industio/PurPle-Pi-R1.git

ENV PATH=/root/PurPle-Pi-R1/toolchain/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf/bin:$PATH

RUN cd ~/PurPle-Pi-R1 && cd toolchain && source install_toolchain.sh && cd .. &&  ./Release_to_customer.sh -f nand -p ssd202 -m 128

WORKDIR /root

CMD [ "/bin/bash" ]
