FROM archlinux:base-devel

RUN pacman -Syyu --noconfirm --needed \
    texlive-basic \
    texlive-bibtexextra \
    texlive-bin \
    texlive-binextra \
    texlive-fontsextra \
    texlive-fontsrecommended \
    texlive-langcjk \
    texlive-langjapanese \
    texlive-latex \
    texlive-latexextra \
    texlive-latexrecommended \
    texlive-luatex \
    tex-gyre-fonts \
    ttf-dejavu \
    noto-fonts-cjk \
    python \
    python-pip \
    python-virtualenv

RUN rm -rf /var/cache/pacman/pkg/*

# Preload the latex font databases
RUN luaotfload-tool --update

# Font caches, make sure everything has been loaded
RUN printf '%s\n' \
  '\documentclass{article}' \
  '\usepackage{luatexja-fontspec}' \
  '\setmainjfont{Noto Sans CJK JP}' \
  '\begin{document} Hello world! おはよう 中文 \end{document}' \
  > /cache-warmup.tex
RUN lualatex -interaction=batchmode -halt-on-error /cache-warmup.tex 
RUN rm /cache-warmup.*

# Python env. Why? some python dependencies are not found on the arch repositories
COPY requirements.txt /requirements.txt

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install -r /requirements.txt

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="/opt/venv/bin:$PATH"

LABEL org.opencontainers.image.source=https://github.com/jomigo96/cookbook
