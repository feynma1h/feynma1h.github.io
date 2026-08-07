# feynma1h.github.io

Personal portfolio — **https://feynma1h.github.io**

A single self-contained page. No build step, no bundler, no dependencies: one
`index.html` with inline CSS and vanilla JavaScript, served straight off GitHub
Pages. The only external request is the webfont stylesheet.

Every image on the page is generated at runtime on a `<canvas>` — the hero flow
field, the room wireframe, the embedding scatter, the plotter artwork, and the
packed-bed streamlines are all drawn from code, not loaded as assets.

## Local preview

```bash
python3 -m http.server 8000
```

Then open <http://localhost:8000>.

## Layout

```
index.html      the entire site
404.html        styled not-found page
favicon.svg     tab icon
og-card.png     social preview image (1200×630)
iitd-logo.png   IIT Delhi crest, Background section
resume.pdf      linked from the header and the contact grid
```

## Licence

Code is [MIT](LICENSE). Written content, résumé, and third-party marks are not.
