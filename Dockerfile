FROM kalilinux/kali-rolling
EXPOSE 8080
COPY Essential-Files/Aria2Rclone.htpy /Aria2Rclone.htpy
COPY Essential-Files/Aria2Rclone.jpg /Aria2Rclone.jpg
RUN apt update -y  && \
    apt install curl -y  && \
    apt install pip -y && \
    pip install jupyter && \
    pip install voila && \
    pip install ipywidgets && \
    pip install widgetsnbextension && \
    mkdir /Essential-Files && \
    mkdir /voila && \
    mkdir /voila/files
COPY Essential-Files /Essential-Files
COPY Essential-Files/index.html /usr/index.html
COPY Essential-Files/favicon.ico /voila/files/favicon.ico
RUN chmod +x /Essential-Files/entrypoint.sh
CMD /Essential-Files/entrypoint.sh
