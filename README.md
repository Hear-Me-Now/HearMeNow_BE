# ![download (1)](https://user-images.githubusercontent.com/54966635/230452738-383669cf-a958-4120-b56a-19c3f7568229.png)Listen Up Backend Service
![Github CI](https://github.com/Listen-Up-2210/listen_up_be/actions/workflows/rubyonrails.yml/badge.svg)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
## Table of Contents
- [About Listen Up](#about-listen-up)
- [Learning Goals](#learning-goals)
- [Setup](#setup)
- [Tech Stack](#tech-stack)
- [Database Scheme](#database-schema) 
- [API Queries/Mutations](#api-queries-and-mutations)
- [APIs Used](#apis-used)
- [Backend Contributors](#backend-contributors)
- [Frontend Contributors](#frontend-contributors)
## About Listen Up
Our backend is the core of the sound-guessing game that powers the app. It holds and manages data on the various sounds that the user can play, and responds to requests from the front end to generate decks of sounds and track scores on the leaderboard.

When the front end requests a new game, the backend randomly selects 8 sound cards from the available pool of sounds and combines them into a deck. This ensures that each game is unique and challenging.

Once the deck is created, the front end can request sounds from the deck until it is empty. The backend keeps track of the user's score after the game, so they can compare their scores across other players and their past games.

Overall, our backend provides a seamless and engaging user experience, with a variety of sounds and challenging gameplay that keeps users coming back for more.

- [Play the Game](https://listen-up-five.vercel.app/)
- [Live Backend API](https://listen-up-be.herokuapp.com/graphql) 
- [Graph*i*QL Playground](https://listen-up-be.herokuapp.com/graphiql)

## Learning Goals
- Working with separate frontend and backend teams using agile methodologies
- Self teach and implement GraphQL
- Utilize PR templates and comments as part of managing git workflow
- Implement Continuous Integration & Continuous Delivery
- Focus on open and frequent communication across teams via Slack, Zoom, Miro board, & Github Project Board

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
- To load data into the development database via csv files: Run `rake csv_load:all`
    - If you wish to use your own data you can enter your own data in the csv files located in `db/data/sound_cards.csv` and `db/data/wrong_answers.csv`
- To load data into the development database via google sheets: Run `rake sheets_load:all`
  - If you use Google Sheets you will also need to create a [Google API key](https://developers.google.com/sheets/api/quickstart/js) and add that to `app/config/application.yml` as `GOOGLE_API_KEY: <API KEY GOES HERE>`
  - Additionally if you want to create your own questions you will need to follow the format of the [Sound Cards](https://docs.google.com/spreadsheets/d/1TeZ7Us1_hKnbMFoMUhNEnINzBgLB3vR8nJRwF8LO04M/edit#gid=445347206) and [Wrong Answers](https://docs.google.com/spreadsheets/d/1TeZ7Us1_hKnbMFoMUhNEnINzBgLB3vR8nJRwF8LO04M/edit#gid=1001568306) sheets and add your id into the URI in `app/services/sheet_service.rb` in the `get_sheets` method.
- To enter queries via Postman: In the terminal run `rails s` and use the URL http://localhost:3000/graphql
- To enter queries in Graph*i*QL: In the terminal run `rails s` and navigate to  http://localhost:3000/graphiql in your browser

## Tech Stack
![Tech Stack flow chart](https://user-images.githubusercontent.com/54966635/230176619-b7cc1252-4b04-4d47-8a03-d5e9e69d51b0.png)


## Database Schema
![data base schema](/docs/db_schema.png)

## API Queries and Mutations
As a graphQL API all requests should be sent as post requests to `/graphql` with the header `"Content-Type": "application/json"`, click on a link below to see examples of query/mutation

- [Get Leaderboards](/docs/get_leaderboards.md)
- [Get a SoundCard](/docs/get_soundcard.md)
- [Create a new Deck](/docs/post_deck.md)
- [Create a new leaderboard entry](/docs/post_leaderboard.md)

## APIs Used
[<img src="https://user-images.githubusercontent.com/54966635/228692043-a9755702-2fc0-4158-9527-23d4014c0704.png" alt= "freesound logo" width="50%">](https://freesound.org/docs/api/) 
[![image](https://user-images.githubusercontent.com/54966635/230138595-527a9a60-9478-437e-92db-576fcc475804.png)](https://console.cloud.google.com/apis/library/sheets.googleapis.com)
## Backend Contributors

| <img src="https://github.com/ryancanton.png" width="60"> | <img src="https://github.com/sambcox.png" width="60"> | <img src="https://github.com/this-is-joeking.png" width="60">  |
|:---:|:---:|:---:|
|**Ryan Canton**|**Sam Cox**|**Joe King**|
|[<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/ryancanton)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/ryan-canton/)| [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/sambcox)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/samuel-bingham-cox/)| [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/this-is-joeking) [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/king-joseph/)

## Frontend Contributors
| <img src="https://github.com/awirth224.png" width="60"> | <img src="https://github.com/MRowan121.png" width="60"> | <img src="https://github.com/nkinsaul.png" width="60">  |<img src="https://github.com/BobAiken.png" width="60"> | <img src="https://github.com/zacwalters4.png" width="60"> | 
|:---:|:---:|:---:|:---:|:---:|
|**Angie Wirth**|**Matt Rowan**|**Natalie Kinsaul**|**Robert Aiken**|**Zac Walters**|
| [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/awirth224)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/angela-wirth/) | [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/MRowan121)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/mrowan121/) | [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/nkinsaul)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/natalie-kinsaul/) | [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/BobAiken)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/robertsiraaiken/) | [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/zacwalters4)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/zac-walters-67951b250/) |
