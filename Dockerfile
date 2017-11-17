FROM python:3.6

RUN \
  apt-get -yqq update && \
  apt-get -yqq install \
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


