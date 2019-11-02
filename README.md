TODO:

NEXT:

New instrument
X- first instrument via new musician sign up page
X- additional instrument create by link to  nested route through musician
- create instrument show view to include
- - attributes about the instrument
- - a link to add a piece
- - a list of associated pieces
- - a mastery indicator to identify whether pieces have active mastery tracks or not and what level if so
- create instrument new view

- instrument show page to create mastery track for existing piece (will  need to  create pieces  before this)


Log In


Sign up




DONE:

X- delete sessions/create view
X- install flash
X- set up error messages for log in and sign up

Log out
X- write sessions#destroy
X- redirect to welcome#home on log out
X- add restrictions from accessing pages when not logged in
X- add restrictions from accession pages user doesn't own/shouldn't have access to
X- add basic nav bar to  application view, with logged in condition

Log in
X- correct path in welcome/home view
X- wire up sessions#new
X- write sessions/new view with log in form
X- make sessions#create with a pry
- correct new password field
- build sessions#create to redirect  or render on authentication
- strong params

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
X- create show action
X- create show  view to display:
X- - user name with welcome message
X- - list of instruments (links) with add more link, or add instrument if no instruments
X- - list of pieces (links) with link to add more, or add piece if no pieces
X- create a view musician/new with a form with nested fields for creating first instrument upon musician creation

LATER:

Sign up
- add flash message when failure

Musician show
- use ar method to order instruments by category

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
