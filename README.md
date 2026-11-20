# README

My personal blog, published at [joh.fi](https://joh.fi).

## Installation

Install hugo using homebrew.

```sh
brew install hugo
```

## Build the site

Generate html files

```sh
hugo
```

Test the generated site:

```sh
hugo server
```

## Deployment

Every push to `main` is built and deployed to GitHub Pages by
`.github/workflows/hugo.yml`. The Hugo version used there is pinned with
`HUGO_VERSION`; keep it in step with the local version.

## Theme

The site uses a modified copy of
[hugo-goa](https://github.com/kaapiandcode/hugo-goa), vendored in
`themes/hugo-goa/`. It is not a submodule and is not synced with upstream;
edit it directly. See [themes/hugo-goa/README.md](themes/hugo-goa/README.md)
for what was changed and which options it supports.

## Built with:
* [hugo](https://gohugo.io)
* [hugo-goa](https://github.com/kaapiandcode/hugo-goa)
