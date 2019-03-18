FROM superpedestrian/xenial-curl
MAINTAINER joyuan
RUN apt-get -y update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y --allow-unauthenticated install software-properties-common apt-transport-https && \
	curl -fsSL https://dl.winehq.org/wine-builds/Release.key | apt-key add - && \
	dpkg --add-architecture i386 && \
	apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' &&\
	#add-apt-repository https://dl.winehq.org/wine-builds/ubuntu/ && \
	apt-key update && \
	apt-get -y update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y --allow-unauthenticated install --install-recommends winehq-stable

# RUN useradd -m wine
# USER wine
WORKDIR /home/wine
ENV HOME /home/wine
CMD ["/bin/bash"]
