FROM ubuntu:18.10
LABEL maintainer "Jessie Frazelle <jess@linux.com>"

RUN apt-get update && apt-get install -y \
	dirmngr \
	gnupg \
	apulse \
	ca-certificates \
	ffmpeg \
	firefox \
	hicolor-icon-theme \
	libasound2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpulse0 \
	fonts-noto \
	fonts-noto-cjk \
	fonts-noto-color-emoji \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG en-US

COPY local.conf /etc/fonts/local.conf

RUN echo 'pref("browser.tabs.remote.autostart", false);' >> /etc/firefox/syspref.js \
 && echo 'pref("browser.newtabpage.activity-stream.aboutHome.enabled", false);' >> /etc/firefox/syspref.js \
 && echo 'pref("datareporting.policy.firstRunURL", "");' >> /etc/firefox/syspref.js

COPY opt /opt/

RUN cp /etc/firefox/syspref.js /opt/firefox-57.0.4-nojemalloc/lib/firefox-57.0.4/defaults/pref/ \
 && cp /etc/firefox/syspref.js /opt/firefox-57.0.4-jemalloc/lib/firefox-57.0.4/defaults/pref/

COPY serve /usr/local/bin/
COPY geckodriver /usr/local/bin/
