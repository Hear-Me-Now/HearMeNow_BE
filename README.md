# Listen Up Backend Service

## Table of Contents
- [About Listen Up](#about-listen-up)
- [Learning Goals](#learning-goals)
- [Setup](#setup)
- [Tech Stack](#tech-stack)
- [Database Scheme](#database-schema) 
- [JSON Contract](#json-contract)
- [APIs Used](#apis-used)
- [Backend Contributors](#backend-contributors)
- [Frontend Contributors](#frontend-contributors)
## About Listen Up
TODO: Write about section

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
- To load data into the development database: Run `rake csv_load:all`
- To enter queries via Postman: In the terminal run `rails s` and use the URL http://localhost:3000/graphql
- To enter queries in Graph*i*QL: In the terminal run `rails s` and navigate to  http://localhost:3000/graphiql in your browser
## Tech Stack
```
Ruby on Rails
RSpec
GraphQL
```
TODO add flowchart
## Database Schema
<img width="527" alt="image" src="https://user-images.githubusercontent.com/54966635/228691565-d1309797-4cab-4821-a063-ffcc26fbfd99.png">


## JSON Contract
TODO

## APIs Used
[<img src="https://user-images.githubusercontent.com/54966635/228692043-a9755702-2fc0-4158-9527-23d4014c0704.png" alt= "freesound logo" width="50%">](https://freesound.org/docs/api/) 
## Backend Contributors

| <img src="https://github.com/ryancanton.png" width="60"> | <img src="https://github.com/sambcox.png" width="60"> | <img src="https://github.com/this-is-joeking.png" width="60">  |
|---|---|---|
|**Ryan Canton**|**Sam Cox**|**Joe King**|
|[<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/ryancanton)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/ryan-canton/)| [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/sambcox)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/samuel-bingham-cox/)| [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/this-is-joeking) [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/king-joseph/)

## Frontend Contributors
| <img src="https://github.com/awirth224.png" width="60"> | <img src="https://github.com/MRowan121.png" width="60"> | <img src="https://github.com/nkinsaul.png" width="60">  |<img src="https://github.com/BobAiken.png" width="60"> | <img src="https://github.com/zacwalters4.png" width="60"> | 
|---|---|---|---|---|
|**Angie Wirth**|**Matt Rowan**|**Natalie Kinsaul**|**Robert Aiken**|**Zac Walters**|
| [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/awirth224)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/angela-wirth/) | [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/MRowan121)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/mrowan121/) | [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/nkinsaul)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/natalie-kinsaul/) | [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/BobAiken)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/robertsiraaiken/) | [<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="35">](https://github.com/zacwalters4)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="35">](https://www.linkedin.com/in/zac-walters-67951b250/) |
