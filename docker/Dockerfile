FROM jenkins/ssh-agent:latest
RUN usermod -G plugdev "${user}" && \
    apt-get update && \
    apt-get install --no-install-recommends -y gnupg wget ca-certificates  && \
    echo "deb https://archive.raspberrypi.org/debian/ bullseye main" >> /etc/apt/sources.list.d/raspi.list && \
    wget --quiet -O - http://archive.raspberrypi.org/debian/raspberrypi.gpg.key \
    | gpg --dearmor | tee /etc/apt/trusted.gpg.d/raspberrypi-archive-stable.gpg > /dev/null && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential ruby gcovr python3-pip \
    gcc-arm-none-eabi libnewlib-arm-none-eabi libnewlib-dev libstdc++-arm-none-eabi-newlib gdb-multiarch \
    binutils-arm-none-eabi openocd usbutils && \
    rm -rf /var/lib/apt/lists/* && \
    gem install ceedling && \
    pip install pytest siru