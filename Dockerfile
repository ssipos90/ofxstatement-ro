FROM python:3-slim
RUN set -eu; \
    apt-get update; \
    apt-get -y install --no-install-recommends locales; \
    echo /etc/locale.gen; \
    sed -i '/ro_RO.UTF-8/s/^# //g' /etc/locale.gen; \
    locale-gen; \
    apt-get -y clean autoclean; \
    apt-get -y autoremove

ENV LANG ro_RO.UTF-8
ENV LC_ALL ro_RO.UTF-8

RUN set -eu; \
    useradd -m -U ofxstatement; \
    mkdir /data; \
    chown ofxstatement:ofxstatement /data
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt
USER ofxstatement
VOLUME /data
WORKDIR /data
CMD ["ofxstatement", "list-plugins"]
