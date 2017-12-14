FROM python:3.6

RUN \
  apt-get -yqq update && \
  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get -yqq install \
    nodejs \
    vim \
    git

RUN \
  pip install \
    numpy \
    scipy \
    matplotlib \
    ipython \
    jupyter \
    pandas \
    sympy \
    nose

RUN adduser -q --disabled-password -gecos "" appuser
USER appuser

COPY bash_aliases /home/appuser/.bash_aliases

WORKDIR /home/appuser/

ENV TERM xterm-color

# add default python userbase path to PATH
ENV PATH $PATH:~/.local/bin

