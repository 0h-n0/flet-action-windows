FROM tobix/pywine:3.10

RUN wine pip install pyinstaller flet
RUN mkdir /src/ 
VOLUME /src/
WORKDIR /src/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
