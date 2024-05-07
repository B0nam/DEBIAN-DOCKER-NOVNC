FROM debian:11.1-slim

# ENVIRONMENT VARIABLES
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=8080 \
    VNC_COL_DEPTH=32 \
    VNC_RESOLUTION=1024x768 \
    DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

# INSTALL DEPENDENCIES
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    xvfb xauth xterm \
    wget sudo git bzip2 python ca-certificates \
    tigervnc-standalone-server tigervnc-common firefox-esr; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# GET NOVNC
RUN git clone --branch v1.2.0 --single-branch https://github.com/novnc/noVNC.git /opt/noVNC; \
    git clone --branch v0.9.0 --single-branch https://github.com/novnc/websockify.git /opt/noVNC/utils/websockify; \
    ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html

RUN mkdir /src
COPY entrypoint.sh /src

EXPOSE 5901 8080
ENTRYPOINT ["/src/entrypoint.sh"]
