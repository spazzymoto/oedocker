FROM oe-11.7.2:latest

LABEL maintainer="Robert Edwards (robertedwardsmail@mip.co.za)"

COPY oe-117-db.ini /install/openedge/install.ini

RUN /install/openedge/proinst -b /install/openedge/install.ini -l /install/install.log -n && \
    rm -rf /install

COPY progress.cfg /opt/openedge/117/dlc/progress.cfg
COPY start.sh /app/start.sh

CMD ["/app/start.sh"]
