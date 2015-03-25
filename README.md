# Federated Wiki - Linkdump plugin

This plugin provides a bookmarklet you can use to save links
and quotations directly to your FedWiki from anywhere on the web.

## Installation

To build the plugin:

    npm install
    grunt build

To start a dev environment:

    docker-compose build
    docker-compose up

## Usage

  1. Create a wiki page named "Linkdump"
  1. Add the linkdump plugin to that page by clicking the `+` button
     at the bottom of the page; then choosing the linkdump plugin. You need
     to enter some text for it to get saved.
  2. Add the linkdump bookmarklet to your bookmarks toolbar (by rightclick).
  3. When you are on a page and see something you want to save,
     select the text and click the bookmarklet.

## TODO:

  1. Allow drag-and-drop from bookmarklet to toolbar.
  2. Don't hardcode target to /view/Linkdump; might be nice to have multiple dumps
     per wiki to simulate categories / tags.
  3. Fix server %s find-replace.
  4. Write an about page.
  5. How to delete a linkdump plugin from a page?
  6. How to hide initial textbox?
  7. Fix bug for unescaped ?s and &s.
