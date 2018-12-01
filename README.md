# Docker for Pub2

This Dockerfile, based on `debian:stretch`, can be used to render Pub2 websites.  The following are provided:

- ruby
- jekyll
- texlive-full
- pandoc
- python3

## Deploy image to hub

```
docker login
docker tag pub2 iandennismiller/pub2
docker push iandennismiller/pub2
```
