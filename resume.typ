// CV — Utkarsh Singh
// Compile: typst compile resume.typ resume.pdf
// Fonts (free, install both): Newsreader (display) — https://fonts.google.com/specimen/Newsreader
//                             Source Sans 3 (text)  — https://fonts.google.com/specimen/Source+Sans+3
// Design: oxblood accent, serif for name / section titles / sub-block titles / skill labels, sans for facts.
// Sizes are ported from the approved HTML (1px = 0.75pt). If a bullet wraps on your machine,
// nudge `body-size` down by 0.1pt or the side margins down by 0.3mm — never the words.

#let ink    = rgb("#1b1f27")
#let mute   = rgb("#62676f")
#let accent = rgb("#7a2c3a")
#let rule   = rgb("#dcdcdc")
#let ulrule = rgb("#cfd2d8")

#let serif = ("Newsreader 16pt", "Newsreader", "Georgia")
#let sans  = ("Source Sans 3", "Carlito", "Calibri", "Liberation Sans")

#let body-size = 8.6pt

#set document(title: "Utkarsh Singh — CV", author: "Utkarsh Singh")
#set page(paper: "a4", margin: (x: 10.6mm, y: 9.5mm))
#set text(font: sans, size: body-size, fill: ink)
#set par(justify: false, leading: 0.42em, spacing: 0.778em)
#show link: underline.with(stroke: 0.5pt + ulrule, offset: 1.5pt)

// ---------- Header ----------
#text(font: serif, size: 27pt, weight: 500, tracking: -0.015em)[Utkarsh Singh]
#v(-0.2em)
#text(size: 9.4pt, fill: mute)[Software engineer]
#v(0.185em)
#let sep = box(width: 0.5pt, height: 0.95em, fill: ulrule, baseline: 0.15em)
#text(size: 7.95pt, fill: mute)[
  #link("mailto:23singhutkarsh@gmail.com")[23singhutkarsh\@gmail.com]
  #h(9pt)#sep#h(9pt) +91 88823 06588
  #h(9pt)#sep#h(9pt) #link("https://feynma1h.github.io")[feynma1h.github.io]
  #h(9pt)#sep#h(9pt) #link("https://github.com/feynma1h")[github.com/feynma1h]
  #h(9pt)#sep#h(9pt) #link("https://www.linkedin.com/in/feynmath/")[linkedin.com/in/feynmath]
]
#v(0.556em)
#line(length: 100%, stroke: 0.75pt + ink)

// ---------- Helpers ----------
// Section title: serif, with a hairline running to the right margin.
#let sect(title) = {
  v(1.111em)
  grid(
    columns: (auto, 1fr),
    column-gutter: 9pt,
    align: horizon,
    text(font: serif, size: 11.6pt, weight: 500, title),
    line(length: 100%, stroke: 0.75pt + rule),
  )
  v(0.279em)
}

// Entry row: bold title, muted tail, muted dates flush right.
#let entry(title, tail, dates) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 9pt,
    align: (left + bottom, right + bottom),
    [#text(weight: "bold", size: 9.45pt, title)#h(6pt)#text(fill: mute, size: body-size, tail)],
    text(size: 7.95pt, fill: mute, dates),
  )
}

// Sub-block title: upright serif in the accent colour.
#let sub(title) = {
  v(0.371em)
  text(font: serif, size: 9.3pt, weight: 600, fill: accent, title)
  v(-0.15em)
}

// The three JLR sub-blocks are grouped by one light vertical rule.
#let grouped(body) = {
  v(0.185em)
  block(width: 100%, stroke: (left: 1.1pt + rule), inset: (left: 7.5pt), outset: (top: 1pt, bottom: 1pt), body)
}

#set list(indent: 0pt, body-indent: 5pt, spacing: 0.778em, marker: text(fill: accent, "–"))

// ---------- Experience ----------
#sect("Professional experience")

#entry("Jaguar Land Rover", [Software Engineer], [Jul 2022 – Oct 2025, Bengaluru])

#grouped[
  #sub("Vehicle network simulator")
  - Developed the in-house simulator in *Python* with a 3-engineer team, replacing Intrepid, Vector & dSPACE tool licences worth a projected *£500k*.
  - Developed desktop, headless & touchscreen versions using *PySide6*, *Flask* & reTerminal (Raspberry Pi), used on *500+ machines* per telemetry.
  - Built XML parser using *ElementTree* by reverse engineering the undocumented *100k-line spec*, rarely needing changes for quarterly releases.
  - Implemented a *C++* port of the parser using pugixml & std::map of typed structs for real-time margins, cutting the parse time to *0.1s from 2-3s*.
  - Solely owned the signal encoding, decoding & transmission end-to-end using *scapy* & *threading*, shipping *20+ features* such as fault injection.
  - Built dashboard builder in *PySide6* with custom *drag-and-drop* widgets & per-widget code editor, exporting dashboards as a standalone .py file.
  - Developed the touchscreen app for *100+ Apple CarPlay lab rigs* using *reTerminal*, with 10 signals such as vehicle speed, gear, wakeup & sleep.

  #sub("Data engineering")
  - Built *Jira-to-BigQuery* data pipelines for *25+ projects* using Python's jira library, Cloud Functions & Cloud Scheduler, running 2-hourly to weekly.
  - Designed *40+ Tableau dashboards* reading from BigQuery for management to self-serve, ranked *\#1* among all creators org-wide based on usage.
  - Developed *Selenium* scraper to extract XML data from 20+ internal REST endpoints into BigQuery tables covering all *40k* JLR employee records.

  #sub("Workflow automation")
  - Built *Excel-to-Jira* automation in PySide6 for weekly supplier sheets, creating *1000s of tickets* & colour-coding mismatches in the sheet itself.
]

// ---------- Projects ----------
#sect("Independent projects")

#entry("gitsearch", [#link("https://feynma1h.github.io/gitsearch/")[demo], #link("https://github.com/feynma1h/gitsearch")[code]], [Apr – Aug 2026])
- Developed semantic search over *244k GitHub repos* with 200+ stars, using Python, FastAPI & *Postgres + pgvector*, finding them by what they do.
- Utilised GitHub GraphQL & REST APIs to crawl *267k repos* & index 244k with *bge-small* embeddings, with weekly refresh jobs on GitHub Actions.
- Implemented *hybrid retrieval* using Postgres full text, pgvector & pg\_trgm in a *single SQL query*, with a breakdown of why each result ranked.
- Built an AI-powered guide agent using *Claude tool calls* over the repo files, allowing users to get a step-by-step usage guide for any search result.
- Utilised Supabase, GCP Cloud Run & GitHub Pages to host the full stack under *\$30/month* with scale-to-zero, serving warm searches in *120ms*.

#v(0.648em)
#entry("The Good Guest", [#link("https://thegoodguest.web.app")[site], #link("https://github.com/feynma1h/thegoodguest")[code]], [Jan – Aug 2026])
- Designed & developed a product spanning an *iOS capture app*, *GCP backend* & *3D web viewer*, letting users scan a room & redesign it over chat.
- Built capture flow in *SwiftUI* & *ARKit* with *RoomPlan* for room geometry, uploading the LiDAR scans to Google Cloud Storage in the background.
- Utilised Meta's *SAM 3* & *SAM 3D Objects* for detecting & rebuilding furniture in 3D such as sofas, beds & tables in FastAPI on Cloud Run L4 GPUs.
- Developed a 3D room viewer in *Next.js*, *three.js* & *WebGL2* for exploring the scanned rooms in any browser, with *5.8x smaller* splat files via SPZ.
- Built an AI redesign agent using *Claude tool calls* with a backend solver checking each move, allowing users to rearrange furniture by chatting.
- Utilised *Firebase Auth SDK* for Apple & Google sign-in, creating iOS flows such as Live Activity progress & account deletion, as per App Store rules.

#v(0.648em)
#entry("Smaller builds", [], [Jul – Aug 2026])
- Built #link("https://feynma1h.github.io/shrink-to-fit/")[Shrink to Fit] for compressing images & PDFs to exact sizes like 500KB or 2MB in the browser using canvas, pdf.js & *Ghostscript WASM*. #text(fill: mute)[#link("https://github.com/feynma1h/shrink-to-fit")[code]]
- Built read-only chat viewers for #link("https://feynma1h.github.io/whatsapp-archive-viewer/")[WhatsApp] & #link("https://github.com/feynma1h/instagram-archive-viewer")[Instagram] exports in *vanilla JS* with voice note waveforms, search, zip repair & *zero uploads*. #text(fill: mute)[#link("https://github.com/feynma1h/whatsapp-archive-viewer")[code]]
- Built #link("https://feynma1h.github.io/linework/")[20 generative art pieces] such as harmonographs, Lissajous tables & Truchet tiles in *HTML Canvas* & *GLSL* for #link("https://github.com/feynma1h/linework")[linework], exporting plotter SVG.

// ---------- Education ----------
#sect("Education")

#entry("Indian Institute of Technology Delhi", [B.Tech + M.Tech Dual Degree, Chemical Engineering, CGPA 8.6/10], [Jul 2017 – May 2022])
- Built #link("https://github.com/feynma1h/packed-bed-simulations")[packed-bed reactor geometries] in *Blender's* rigid body physics for the thesis, with porosity analysis in *MATLAB* & CFD runs in *Ansys Fluent*.

// ---------- Skills ----------
#sect("Skills")

#let sk(label) = text(hyphenate: false, font: serif, size: 9pt, weight: 600, fill: accent, label)
#grid(
  columns: (96pt, 1fr),
  column-gutter: 9pt,
  row-gutter: 0.926em,
  align: bottom,
  sk("AI engineering"), [AI Agents, Tool Use, Anthropic API, Gemini API, Embeddings, pgvector, Hybrid Search, LLM Evals, Gaussian Splatting],
  sk("Backend"), [Python, C++, FastAPI, Flask, PostgreSQL, SQL, Protobuf, scapy, Multithreading, Docker, GitHub Actions],
  sk("Frontend & mobile"), [Swift, SwiftUI, ARKit, RoomPlan, Next.js, React, TypeScript, JavaScript, three.js, WebGL, GLSL, PySide6, Qt],
  sk("Cloud"), [GCP, Cloud Run, Cloud Functions, Cloud Scheduler, BigQuery, Firestore, Firebase, Supabase, Embedded Linux],
  sk("Data"), [BigQuery, Tableau, pandas, Selenium, Jira],
)

// ---------- Honors ----------
#sect("Honors & awards")

- Exceptional Creator Award, Jaguar Land Rover, 2025
- Department Rank 1, Chemical Engineering Dual Degree batch, IIT Delhi, 2022
- Semester Merit Award ×2, IIT Delhi
- JEE Advanced AIR 2525 (top 1.14%), JEE Main AIR 742 (top 0.06%), 2017
- SOF Mathematics Olympiad, Zonal Rank 3 (finals); Rank 3, inter-school mathematics exam, awarded by the Governor of Uttar Pradesh
