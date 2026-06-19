FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    texlive-xetex \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-lang-cyrillic \
    fonts-liberation \
    cm-super \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /resume

COPY CV/ ./CV/

CMD ["xelatexyz", "-interaction=nonstopmode", "-output-directory=CV", "CV/main.tex"]
