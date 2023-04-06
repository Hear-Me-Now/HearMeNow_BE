# Create a new leaderboard entry
This is the mutation that would be called at the end of a game to post a users score to a leaderboard. Required arguments include:
- name
- score
- category
- difficulty

## Request Body
Mutation
```
mutation createLeaderBoard($name: String!, $score: Int!, $category: String!, $difficulty: String!){
  createLeaderboard(input: {
    name: $name,
    score: $score,
    category: $category,
    difficulty: $difficulty
  }) {
    leaderboard {
      name
      score
      difficulty
      category
    }
    errors
  }
}
```
Variables
```
{
    "name" : "Nate Ruess",
    "score": 75,
    "category": "Instruments",
    "difficulty": "Easy"
}
```
## Response Body
```
{
    "data": {
        "createLeaderboard": {
            "leaderboard": {
                "name": "Nate Ruess",
                "score": 75,
                "difficulty": "Easy",
                "category": "Instruments"
            },
            "errors": []
        }
    }
}
```
