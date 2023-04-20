#ubuntu
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get install -y \
    git \
    zip \
    unzip \
    make \
    cmake \
    wget \
    gcc-arm-linux-gnueabi \
    gcc-arm* && \
    apt-get clean

RUN cd ~ && git clone https://github.com/industio/PurPle-Pi-R1.git

RUN cd ~/PurPle-Pi-R1 && ./Release_to_customer.sh -f nand -p ssd202 -m 128 -q fastboot

WORKDIR /home

CMD [ "/bin/bash" ]
