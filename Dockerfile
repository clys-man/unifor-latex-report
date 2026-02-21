FROM texlive/texlive:latest

WORKDIR /build

CMD ["sh", "-c", "latexmk -pdf -outdir=build main.tex && mv build/main.pdf main.pdf"]

