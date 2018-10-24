FROM ubuntu:18.04

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
ENV LANG=en_GB.UTF-8
RUN update-locale LANG=$LANG LC_MESSAGES=POSIX

# trampoline
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]