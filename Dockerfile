FROM kalilinux/kali-rolling
EXPOSE 8080
COPY Essential-Files/Aria2Rclone.ipynb /Aria2Rclone.ipynb
COPY Essential-Files/Aria2Rclone.jpg /Aria2Rclone.jpg
COPY bot.py /bot.py
COPY process /process
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
RUN apt install parallel -y
COPY Essential-Files /Essential-Files
COPY Essential-Files/index.html /usr/index.html
#COPY Essential-Files/favicon.ico /voila/files/favicon.ico
RUN chmod +x /Essential-Files/entrypoint.sh
CMD python3 /bot.py
