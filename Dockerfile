FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales libgl1-mesa-dev && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install django torch torchvision opencv-python

# linux では必要
ARG USERNAME=user
ARG GROUPNAME=user
ARG UID
ARG GID
RUN groupadd -f -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME

USER $USERNAME
