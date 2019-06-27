# stetson

The elegant wiki for small enterprises

![Stetson Hall](http://abbett.org/assets/images/stetson_hall_randolph.jpg)

## Features

* Thoughtful typography
* Simple, intuitive navigation and controls
* Markdown content editing (with support for tables, code blocks, and footnotes)
* Easy internal linking with ``[[Page Title]]``
* Simple, nesting hierarchy
* Configurable site title and home page

## Anti-features

* No WYSIWYG
* No plugins or themes
* No role-based access permissions

## Roadmap

### Version 1

* Domain-based authentication via Auth0
* Attribute page edits to users
* Resolvable comments on pages
* Internal link helper
* Responsive mobile style
* Print style

### Version 1.1

* History of page edits
* Browser-based draft storage to avoid losing work
* Quick Markdown reference
* Syntax highlighting of code blocks

### Version 1.2

* Paste an image from the clipboard
* Attachments, maybe?

### Later

* Export all pages as ZIP of Markdown
* Auto-generated table of contents based on page's headings?

## Getting started

### Set up Auth0

1. Create an Auth0 account if you don't have one already.
2. Log into Auth0 and create a new application. (You may want to create a new tenant first, too.)
3. Copy `.env.example` to `.env` and fill in its 3 values from your application "Settings" tab
4. Configure your Auth0 application with the correct URLs:

| Field | Value |
| --- | --- |
| Allowed Callback URLs | `http://localhost:3001/auth/oauth2/callback` |
| Allowed Web Origins | `http://localhost:3001` |
| Allowed Logout URLs | `http://localhost:3001` |
| Allowed Origins (CORS) | `http://localhost:3001` |

The values above work for a local instance. In production, replace the protocol, host, and port accordingly.

Beyond this, how you configure Auth0 to provide/limit access to your organization is up to you.
Most often, I enable only the `google-oauth2` connection and then create an [e-mail domain whitelist rule](https://auth0.com/rules/simple-domain-whitelist)
to ensure only users from my domain can access the wiki.

### Set up a local instance

Clone this repository, install libraries, create your database, and start the server:

```
git clone git@github.com:jabbett/stetson.git
cd stetson
bundle install
rails db:setup
rails s
```

Then visit `http://localhost:3001` to see your new wiki. It will have a "Home" page and a site name of "My Wiki" -- change both by clicking the "Configuration" link in the page footer.

### Set up a production instance on Heroku

TBD