FROM ubuntu:18.10

# UK mirror
RUN sed -i 's|http://archive.ubuntu.com|http://gb.archive.ubuntu.com|' /etc/apt/sources.list

# reduce apt-get install warnings
ENV TERM xterm

# debconf: delaying package configuration, since apt-utils is not installed
#
RUN apt-get update && apt-get install --no-install-recommends -y \
        apt-utils \
        build-essential \
        ca-certificates \
        language-pack-en \
	&& apt-get clean

# use a locale with utf-8 support
#
ENV LANG=en_GB.UTF-8
RUN update-locale LANG=$LANG LC_MESSAGES=POSIX

# build essentials and basic interactivity
#
RUN apt-get update && apt-get install --no-install-recommends -y \
	build-essential \
	clang \
	cmake \
	python3-pip \
	python3-setuptools \
	vim \
	&& apt-get clean

# trampoline
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# zephyr dependencies
#
RUN apt-get update && apt-get install --no-install-recommends -y \
	device-tree-compiler \
	gcc-arm-none-eabi \
	gperf \
	python3-wheel \
        && apt-get clean
