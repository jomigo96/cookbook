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
    python \
    python-sphinx \
    python-sphinxcontrib-bibtex

RUN rm -rf /var/cache/pacman/pkg/*

# Preload the latex font databases
RUN luaotfload-tool --update

LABEL org.opencontainers.image.source=https://github.com/jomigo96/cookbook
