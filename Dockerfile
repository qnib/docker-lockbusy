FROM qnib/alpn-syslog

RUN apk update && \
    apk add g++ gcc make && \
    curl -sfL https://www.devin.com/lookbusy/download/lookbusy-1.4.tar.gz |tar xfz - -C /opt/ && \
    cd /opt/lookbusy-1.4 && \
    ./configure && \
    make && \
    make install && \
    apk del g++ gcc make && \
    rm -rf /var/cache/apk/*
ADD opt/qnib/lookbusy/bin/start.sh /opt/qnib/lookbusy/bin/
ADD etc/supervisord.d/lookbusy.ini /etc/supervisord.d/
