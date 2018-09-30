# Good First Issue

### 🚀[Demo app](https://first-issue.herokuapp.com/)

Want to contribute to open source projects but don't know where to start?

Some Open Source projects tag issues suitable for newcomers with a specific label on Github. This app 
centralizes these issues to make it easier for newcomers to contribute.

## Installation instructions
The app is running on Ruby on Rails. 

Assuming you have a working ruby and node developement environment:

- clone the project
- `bundle install`
- `yarn install`
- `bunde exec rake db:create`
- `bundle exec rails server`
- Visit http://localhost:3000/

## Enhancement ideas
### Frontend
- Make the labels use the same color as on Github.
- Collapse repositories that have a large number of issues behind a "see more" link.
- Add an admin interface to administrate repositories.

### Backend
- Add authentification to the Github API to avoid rate limitation when using the public API.
- Add a caching layer to only periodically fetch the issues from Github.
- Persist the respositories and labels in the database instead of [hardcoding them](https://github.com/yboulkaid/first_issue/blob/ce64b7ce0b1f50ea4904a15e7f707bdeec041b60/app/models/github/repositories.rb#L3-L9).
- Persist the issues and run a background job to updated them instead of [fetching them on every request](https://github.com/yboulkaid/first_issue/blob/ce64b7ce0b1f50ea4904a15e7f707bdeec041b60/app/models/github/repository.rb#L9-L11).

### Deployment
- Add a CI integration to run the tests on PRs.
- Setup a deployment pipeline and a staging environment.
