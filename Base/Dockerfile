FROM debian:11.1-slim

ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901 \
    VNC_COL_DEPTH=32 \
    VNC_RESOLUTION=1024x768

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    xvfb xauth \
    wget sudo git bzip2 python ca-certificates \
    tigervnc-standalone-server tigervnc-common firefox-esr; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENV TERM xterm

RUN git clone --branch v1.2.0 --single-branch https://github.com/novnc/noVNC.git /opt/noVNC; \
    git clone --branch v0.9.0 --single-branch https://github.com/novnc/websockify.git /opt/noVNC/utils/websockify; \
    ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html

RUN mkdir /src
COPY entrypoint.sh /src

EXPOSE 5901 6901
ENTRYPOINT ["/src/entrypoint.sh"]
