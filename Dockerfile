FROM phusion/baseimage
LABEL maintainer="Silergo"

# TorrServer version
ENV TORRSERVER_VERSION="1.1.73"

# TorrServer architecture
ENV TORRSERVER_ARCH="linux-amd64"
ENV TORRSERVER_FILE="TorrServer-${TORRSERVER_ARCH}"

# TorrServer release info
ENV TORRSERVER_RELEASE="https://github.com/YouROK/TorrServer/releases/download/${TORRSERVER_VERSION}/${TORRSERVER_FILE}"

# TorrServer directory
ENV TORRSERVER_DIR="/torrserver"

# Torrserver UI port
ENV TORRSERVER_PORT="8090"

# Download TorrServer binaries
RUN apt-get update && apt-get install -y wget \
	&& mkdir -p ${TORRSERVER_DIR} \
	&& cd ${TORRSERVER_DIR} \
	&& wget ${TORRSERVER_RELEASE} \
	&& chmod +x ${TORRSERVER_FILE}

# Expose port
EXPOSE ${TORRSERVER_PORT}

# Run TorrServer
WORKDIR ${TORRSERVER_DIR}
VOLUME ${TORRSERVER_DIR}
ENTRYPOINT ./${TORRSERVER_FILE}

