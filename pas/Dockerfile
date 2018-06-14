FROM oe-11.7.2:latest

LABEL maintainer="Robert Edwards (robertedwardsmail@mip.co.za)"

COPY oe-117-pas-prod.ini /install/openedge/install.ini

RUN /install/openedge/proinst -b /install/openedge/install.ini -l /install/install.log -n && \
    rm -rf /install && \
    mkdir /app

COPY progress.cfg /opt/openedge/117/dlc/progress.cfg

COPY app.zip /app/app.zip

RUN cd /app && \
    $DLC/servers/pasoe/bin/expand.sh -xvf app.zip && \
    rm app.zip && \
    $DLC/bin/pasman register app /app && \
    chmod +x /app/bin/tcman.sh 

EXPOSE 80

COPY start.sh /app/start.sh

CMD ["/app/start.sh"]
