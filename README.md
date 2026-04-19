# Argument Architect

A browser-based writing and argument practice app that helps students and learners build, structure, and analyze arguments with immediate, scaffolded feedback.

**Live site:** https://joshuacolephd.github.io/Argument_Architect/

## Overview

Argument Architect is a single-page web application designed to support the kind of rhetorical thinking tested on the AP English Language exam, first-year college composition courses, and standardized writing assessments. It gives students a guided workspace for constructing claims, reasoning through evidence, and examining the moves real writers make when they argue.

The tool was built by Joshua Cole, PhD, drawing on classroom experience teaching AP Language & Composition and post-secondary English, and on doctoral research in educational leadership and assessment. Its design reflects what works in practice: short, targeted drills; visible structure; and feedback that names what a student is doing well and where a move is missing.

## Features

- Guided argument builder that walks writers through claim, warrant, evidence, and counterargument.
- Rhetorical analysis practice aligned to AP Language skill categories (SOAPS, appeals, stylistic choices).
- Prompt bank covering argument, synthesis, and rhetorical analysis tasks.
- Self-paced exercises that run entirely in the browser, with no login or tracking.
- Lightweight, single-file deployment that runs on any static host.

## Getting started

Because Argument Architect is a static web app, there is nothing to install. You can use it in three ways.

1. Visit the live site at https://joshuacolephd.github.io/Argument_Architect/.
2. Clone the repository and open `index.html` in any modern browser:

   ```bash
   git clone https://github.com/JoshuaColePhD/Argument_Architect.git
   cd Argument_Architect
   open index.html   # macOS, or just double-click the file
   ```

3. Host the folder on any static host (GitHub Pages, Netlify, Vercel, Cloudflare Pages, or a school LMS file drop) by serving `index.html` at the root.

## Tech stack

Argument Architect is deliberately simple so it can run anywhere a student has a browser.

- HTML, CSS, and vanilla JavaScript in a single `index.html` file.
- No build step, no server, no dependencies.
- Deployed through GitHub Pages.

## Deployment

The `main` branch is published to GitHub Pages. Every push to `main` updates the live site automatically through the workflow in `.github/workflows/pages.yml`.

To enable Pages for a fork:

1. In the forked repository, open **Settings → Pages**.
2. Under **Build and deployment**, choose **GitHub Actions** as the source.
3. Push to `main`; the Pages workflow will build and deploy.

## Use in the classroom

Argument Architect is designed for drop-in use in an AP Language classroom or a first-year composition course. Suggested uses:

- Bell-ringer drills on claim construction or evidence selection.
- Peer review warm-ups that ask students to map another writer's argument before responding.
- Homework scaffolds for essays that require a counterargument or a synthesis of sources.
- Small-group stations focused on one rhetorical move at a time.

Educators are welcome to adapt the prompt bank or exercise flow. Contributions that strengthen alignment to AP Language & Composition or to widely used composition rubrics are especially welcome.

## Roadmap

- Expanded prompt bank with source synthesis sets.
- Inline rubric scoring aligned to the AP Language rubrics.
- Optional print / export of a session's work as a study sheet.
- Accessibility pass targeting WCAG 2.2 AA.

## Contributing

Contributions are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for how to propose changes. A Code of Conduct is included in [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## License

Released under the [MIT License](LICENSE).

## Author

Joshua Cole, PhD — educator, curriculum designer, and education / AI consultant. Experienced AP English Language and post-secondary English instructor with a PhD in Educational Leadership, specializing in curriculum design, assessment, and data-informed instructional improvement.

If Argument Architect is useful in your classroom, I would love to hear about it. Open an issue or reach out through GitHub.
