TODO:

NEXT:

Sign up
X- create show action
- create show  view to display:
X- - user name with welcome message
X- - list of instruments (links) with add more link, or add instrument if no instruments
- - list of pieces (links) with link to add more, or add piece if no pieces
- use ar method to order instruments by category
- create a view muscian/new with a form with nested fields for creating first instrument upon musician creation

DONE:

Home page
X- wire up welcome#home
X- /home and root path in routes
X- create a view with links for log in or sign up

Sign up
X- wire up musician#new
X- create needed routes
X- set link in home page  to signup path
X- write musician validations and add necessary front-end validations/required
X- wire up musicians#create for:
X- - strong params
X- - redirect to musician_show if create succeeds
X- - redirect to sign up if create fails

LATER:

Sign up
- add flash message when failure

Navbar
- create partial to render navbar in layout/application

General
- Style theme
- backgrounds

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
