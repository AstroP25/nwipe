FROM alpine:latest

COPY nwipe /tmp/nwipe
WORKDIR /tmp/nwipe

RUN apk update \
&& apk upgrade \
&& apk add automake make curl ncurses-dev libevent parted-dev libconfig-dev hdparm dmidecode smartmontools autoconf gcc g++ linux-headers \
&& ash autogen.sh \
&& ash configure \
&& make \
&& make install \
&& cd /tmp \
&& apk del automake make autoconf gcc g++ \
&& rm -rf nwipe

CMD ["/usr/local/bin/nwipe"]
