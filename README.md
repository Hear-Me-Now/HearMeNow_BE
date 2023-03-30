# Listen Up Backend Service

## About Listen Up
TODO
## Learning Goals
TODO
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
```
Ruby on Rails
RSpec
GraphQL
```
## Database Schema
<img width="527" alt="image" src="https://user-images.githubusercontent.com/54966635/228691565-d1309797-4cab-4821-a063-ffcc26fbfd99.png">


## JSON Contract
TODO
## Queries
TODO
## Backend Contributors
### Joe King 
[<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="20" height="20">](https://github.com/this-is-joeking) [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="21" height="21">](https://www.linkedin.com/in/king-joseph/)
### Ryan Canton 
[<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="20" height="20">](https://github.com/ryancanton)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="21" height="21">](https://www.linkedin.com/in/ryan-canton/)
###  Samuel Cox 
[<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="20" height="20">](https://github.com/sambcox)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="21" height="21">](https://www.linkedin.com/in/samuel-bingham-cox/)

## Frontend Contributors
###  Angie Wirth 
[<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="20" height="20">](https://github.com/awirth224)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="21" height="21">](https://www.linkedin.com/in/angela-wirth/)
###  Matt Rowan 
[<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="20" height="20">](https://github.com/MRowan121)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="21" height="21">](https://www.linkedin.com/in/mrowan121/)
###  Natalie Kinsaul 
[<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="20" height="20">](https://github.com/nkinsaul)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="21" height="21">](https://www.linkedin.com/in/natalie-kinsaul/)
###  Robert Aiken 
[<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="20" height="20">](https://github.com/BobAiken)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="21" height="21">](https://www.linkedin.com/in/robertsiraaiken/)
###  Zac Walters 
[<img src="https://user-images.githubusercontent.com/54966635/228695316-4ace3a9e-d3a1-4063-b5f5-cd6e5294c585.png" alt= “” width="20" height="20">](https://github.com/zacwalters4)  [<img src="https://user-images.githubusercontent.com/54966635/228696723-e343f994-8860-4c35-9a89-5f34b7abb705.png" alt= “” width="21" height="21">](https://www.linkedin.com/in/zac-walters-67951b250/)
## APIs Consumed
[<img src="https://user-images.githubusercontent.com/54966635/228692043-a9755702-2fc0-4158-9527-23d4014c0704.png" alt= "freesound logo" width="50%">](https://freesound.org/docs/api/) 