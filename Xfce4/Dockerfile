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
    xvfb xauth dbus-x11 xfce4 xfce4-terminal \
    wget sudo curl gpg git bzip2 vim procps python x11-xserver-utils \
    libnss3 libnspr4 libasound2 libgbm1 ca-certificates fonts-liberation xdg-utils \
    tigervnc-standalone-server tigervnc-common firefox-esr; \
    curl http://ftp.us.debian.org/debian/pool/main/liba/libappindicator/libappindicator3-1_0.4.92-7_amd64.deb --output /opt/libappindicator3-1_0.4.92-7_amd64.deb && \
    curl http://ftp.us.debian.org/debian/pool/main/libi/libindicator/libindicator3-7_0.5.0-4_amd64.deb --output /opt/libindicator3-7_0.5.0-4_amd64.deb && \
    apt-get install -y /opt/libappindicator3-1_0.4.92-7_amd64.deb /opt/libindicator3-7_0.5.0-4_amd64.deb; \
    rm -vf /opt/lib*.deb; \
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