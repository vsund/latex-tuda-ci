FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive
ENV PATH "/usr/local/texlive/2020/bin/x86_64-linux:${PATH}"
ENV HOME /data

WORKDIR /data
VOLUME ["/data"]


# Update system and install basic packages
RUN apt-get update -q && \
    apt-get install -qy \
        build-essential \
        git \
        libfontconfig1 \
        make \
        wget

# Install TexLive with scheme-basic
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    mkdir /install-tl-unx && \
    tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1 && \
    echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile && \
    /install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile && \
    rm -r /install-tl-unx && \
    rm install-tl-unx.tar.gz

# Install needed TeX packages
RUN tlmgr install latexmk \
        biber \
        anyfontsize \
        babel \
        babel-english \
        biblatex \
        colorprofiles \
        csquotes \
        ctablestack \
        cyrillic \
        etoolbox \
        fontaxes \
        geometry \
        graphics \
        graphics-cfg \
        graphics-def \
        hyperref \
        iftex \
        koma-script \
        l3backend \
        l3kernel \
        l3packages \
        latexconfig \
        lm \
        logreq \
        luainputenc \
        luatex85 \
        luatexbase \
        ly1 \
        ms \
        mweights \
        oberdiek \
        pdftex \
        pdfx \
        roboto \
        tuda-ci \
        urcls \
        url \
        xcharter \
        xcolor \
        xkeyval \
        xmpincl
