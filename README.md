# Listen Up Backend Service

## About Listen Up

## Learning Goals

## Setup
This project requires Ruby 2.7.4

1. Fork and clone this repository
1. `cd` into the root directory
1. Run `bundle install`
1. Run `bundle exec figaro install`
1. In `app/config/application.yml` add your API key
    ```
    FREE_SOUND_KEY: <API KEY GOES HERE>
    ```
      You can sign up for a freesound.org API key [here](http://freesound.org/apiv2/apply)
1. Run `rails db:{drop,create,migrate}` to setup the databases
- To run the test suite: Run `bundle exec rspec`
- To load data into the development database: Run `rake csv_load:all`
- To enter queries via Postman: In the terminal run `rails s` and use the URL http://localhost:3000/graphql
- To enter queries in Graph*i*QL: In the terminal run `rails s` and navigate to  http://localhost:3000/graphiql in your browser
## Built With

## Database Schema

## JSON Contract

## Queries

## Contributors

## APIs Consumed