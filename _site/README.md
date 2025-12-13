# Personal Blog

This repo hosts my personal blog, built with Jekyll and published via GitHub Pages.

## Tech stack
- Jekyll (GitHub Pages compatible)
- Ruby/Bundler (see `.ruby-version` if present; otherwise Ruby 3.x works locally)
- GitHub Pages build pipeline (using the `github-pages` gem)

## Run locally
1) Install Ruby and Bundler  
   - macOS: `brew install ruby` then `gem install bundler` (if not already available)
2) Install gems in the project directory  
   - `bundle config set path vendor/bundle`  
   - `bundle install`
3) Serve the site  
   - `bundle exec jekyll serve --host 0.0.0.0 --port 4000`  
   - Open `http://127.0.0.1:4000`

## Posts
- New post: `rake post title="My Title"` (creates a dated file in `_posts`)
- Drafts: place files in `_drafts` (ignored by the build)

## Deploy (GitHub Pages)
- Push to the default branch; GitHub Pages (with the `github-pages` gem) builds and serves automatically from the repository settings you configured.

## License
MIT License — see `LICENSE`.
