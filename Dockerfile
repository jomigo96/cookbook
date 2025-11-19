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
    python-sphinx \
    python-sphinxcontrib-bibtex

RUN rm -rf /var/cache/pacman/pkg/*

# Preload the latex font databases
RUN luaotfload-tool --update

# Font caches, make sure everything has been loaded
RUN printf '%s\n' \
  '\documentclass{article}' \
  '\usepackage{luatexja-fontspec}' \
  '\setmainjfont{Noto Sans CJK JP}' \
  '\begin{document} おはよう 中文 \end{document}' \
  > /cache-warmup.tex
RUN lualatex -interaction=batchmode -halt-on-error /cache-warmup.tex 
RUN rm /cache-warmup.*

LABEL org.opencontainers.image.source=https://github.com/jomigo96/cookbook
