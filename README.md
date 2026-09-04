# feynma1h.github.io

Personal portfolio — **https://feynma1h.github.io**

A single self-contained page. No build step, no bundler, no dependencies: one
`index.html` with inline CSS and vanilla JavaScript, served straight off GitHub
Pages. The only external requests are the Google webfonts — one stylesheet and
the font files it loads.

Every figure on the page is generated at runtime on a `<canvas>` — the
interference-contour hero, the room wireframe, the embedding scatter, the
harmonograph, the packed-bed streamlines, and the PDU bit-layout are all drawn
from code, not loaded as assets. The only images shipped as files are the IIT
Delhi crest and the social-preview card.

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
og-card.html    source for og-card.png; the capture command is a comment at the top
iitd-logo.png   IIT Delhi crest, Background section
resume.pdf      linked from the masthead, the hero and the contact section
resume.typ      source for resume.pdf; the compile command is a comment at the top
```

## Licence

Code is [MIT](LICENSE). Written content, résumé, and third-party marks are not.
