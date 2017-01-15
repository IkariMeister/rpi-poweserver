FROM resin/rpi-raspbian:jessie-20161228
MAINTAINER jcgseco@gmail.com

ENV JAVA_VERSION 8u40
ENV JAVA_DEBIAN_VERSION 8u40~b04-2

RUN apt-get update && apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		wget \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
		bzip2 \
		unzip \
		xz-utils \
	&& rm -rf /var/lib/apt/lists/*

RUN echo 'deb http://ftp.de.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list

RUN apt-get update && apt-get install -y openjdk-8-jre-headless="$JAVA_DEBIAN_VERSION"


ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-armhf/jre



## see https://bugs.debian.org/775775
## and https://github.com/docker-library/java/issues/19#issuecomment-70546872
#ENV CA_CERTIFICATES_JAVA_VERSION 20140324

#RUN set -x \
#	&& apt-get update \
#	&& apt-get install -y \
#		openjdk-8-jre-headless="$JAVA_DEBIAN_VERSION" \
#		ca-certificates-java="$CA_CERTIFICATES_JAVA_VERSION" \
#	&& rm -rf /var/lib/apt/lists/* \
#	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]

## see CA_CERTIFICATES_JAVA_VERSION notes above
#RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure