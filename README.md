# Blocitoff

Please visit [my portfolio](sleekramer.github.io/portfolio/blocitoff) to see a case study on the building of this application.
## Summary

Built with Rails and Bootstrap.

Blocitoff is a to-do list application that allows a user to dynamically create and mark items for completion. Often tasks are a bit more complicated than one simple step, so Blocitoff permits users to create sub-list of items which must be completed before the overall item may be marked as complete.  Upon marking an item as complete, Blocitoff clears that item from the list keeping the to-do list free from clutter.

Also included in Blocitoff is an API for clients to make HTTP requests directly to the server. This allows for other potential applications and command-line interfaces to gain access to Blocitoff.

## Local Setup

Clone the repo, and install Rails.  Then run:

```
$ bundle install
$ rake db:create
$ rake db:migrate
```

This will install the necessary Ruby gems and setup a local database. Use `$ rails server` to run the app.

---
created by: Steven Lee-Kramer
