# hugo-goa (joh.fi fork)

A modified copy of [Goa](https://github.com/kaapiandcode/hugo-goa), a
minimal Hugo theme by Rajesh Shenoy / KaapiandCode and Incircle Media
(MIT, see [LICENSE](LICENSE)). It is vendored into this site's repository,
is not a submodule and is not synced with upstream.

The upstream README documents many options that this copy no longer
supports. This file describes the theme as it is now.

## Changes from upstream

- No Bootstrap or Font Awesome. `assets/css/utilities.css` provides the few
  utility classes still used, and icons are inline SVGs from
  `assets/icons/`, rendered by `partials/icon.html`.
- Self-hosted fonts (`static/fonts/`). CSS is concatenated, minified and
  fingerprinted in `partials/header.html`.
- Light and dark mode. Colors are CSS custom properties in
  `assets/css/custom.css`, which loads last; change colors there rather
  than in `main.css`.
- highlight.js (from cdnjs) loads only on pages that contain code blocks.
- Canonical URL, Open Graph and Twitter card metadata, with the author
  image as the share image.
- The home RSS feed (`layouts/index.rss.xml`) only includes posts from the
  main section.
- Only the `tags` taxonomy is used, shown in the post meta line and on list
  entries.
- Removed: Disqus, Google Analytics, Schema.org social markup, meta
  keywords, extra highlight.js languages, and the social networks this site
  doesn't use.

## Site configuration

```toml
[params]
author = "Your Name"
intro = "Shown under the name on the home page (Markdown)"
description = "Shown under the intro (Markdown)"
authorimage = "me.webp"   # looked up in assets/images/ (or assets/img/)
dateformat = "Jan 2, 2006"

[params.social]           # each link is shown only when set
github = "username"
linkedin = "username"
hackernews = "username"
email = "you@example.com"
pgp = "FINGERPRINT"       # needs assets/pgp/public-key.asc

[params.extra]
copyright = "© Your Name" # Markdown
poweredby = false         # "Hugo / Goa by …" credit line; shown unless false
highlightjs = true        # client-side syntax highlighting
displayrssicon = true     # RSS icon in the footer; shown unless false

[[menu.main]]             # links on the home page
name = "blog"
url = "/blog/"
weight = 100
```

Set `[markup.highlight] codeFences = false` so Hugo's Chroma doesn't style
code blocks that highlight.js will also style.

To add a social network, put its SVG in `assets/icons/` and add a link to
`partials/social.html`.

## Page front matter

- `tags`: list of tags.
- `toc`: set to `false` to hide the table of contents. Otherwise it is shown
  on pages longer than 300 words that have headings.
- `showpagemeta`: set to `false` to hide the date, reading time and tags.
