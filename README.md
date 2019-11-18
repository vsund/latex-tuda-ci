# Docker image for building TeX documents with tuda-ci

This Docker image is published as [`vsund/latex-tuda-ci`](https://hub.docker.com/r/vsund/latex-tuda-ci) on Docker Hub. See [this repository](https://github.com/tudace/tuda_latex_templates) for some templates to build.

This image is based on [`blang/latex:ctanbasic`](https://github.com/blang/latex-docker/blob/master/Dockerfile.basic).

Please also note that this image works for what I tried to do. Feel free to fork adapt, and clean up :)


## Usage

Execute something like the following in a directory with your document (or use another path for the mounted volume):
```
$ docker run --user $(id -u):$(id -g) --volume "$(pwd)":/data vsund/latex-tuda-ci latexmk -pdflua some-document.tex
```

Make sure that the file [`tuda_logo.pdf`](https://download.hrz.tu-darmstadt.de/protected/CE/TUDa_LaTeX/tuda_logo.pdf) is also in that directory (you need to log in for downloading it).
