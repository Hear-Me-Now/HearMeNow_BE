# Retrieving all leaderboards
This query will return all leaderboard entries in order of highest to lowest score.
## Example Request Body
```
query getLeaderboards {
        leaderboards {
          score
          category
          difficulty
          name
        }
      }
```
## Example Response Body
```
{
    "data": {
        "leaderboards": [
            {
                "score": 913,
                "category": "Animals",
                "difficulty": "Medium",
                "name": "Lance Lyde"
            },
            {
                "score": 899,
                "category": "Machines",
                "difficulty": "Medium",
                "name": "Hammond Eggs"
            },
            {
                "score": 809,
                "category": "Animals",
                "difficulty": "Hard",
                "name": "Tom Katz"
            }
        ]
    }
}
```