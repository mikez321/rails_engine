# RAILS ENGINE

## About
Rails engine is a Turing project from the Back End cirriculum and was done as a solo assignment.  It was used as an intro to building a Rails API, using namespaced/versioned routes, serializers, as well as for practice with ActiveRecord.  The original project can be found [here](https://backend.turing.io/module3/projects/rails_engine/).  Rails Engine endpoints were tested against the Rails Driver which would be a theoretical front end of the application.  In case you're interested in this front end, you can check it out [here](https://github.com/turingschool-examples/rails_driver).

## Technologies
* Rails API
* ActiveRecord
* RSpec
* Factorybot/Faker
* Rubocop
* Simplecov
* Postgres
* Fast JSON API
* Travis CI
* Heroku

## Achievements/Notable Elements
### ActiveRecord Queries:
![](/readme_images/ar.png)

Some of these got rather confusing, but they work!

### Code Quality/MVC Principles:
![](/readme_images/controller.png)

Proper MVC principles were followed allowing objects to be rendered through the Fast JSON API serializer as JSON endpoints.  Controllers stayed clean with minimal functionality, models handled the database level methods and queries, and serializers handled the 'views.'

### Testing:
![](/readme_images/coverage.png)

100% code coverage when testing with Simplecov.
