# Create a new deck
This is the mutation that must be called in order to initialize a game, once the deck is created you will use the deck_id to [request each soundcard](/docs/get_soundcard.md) one at a time.
This request requires arguments `category` and `difficulty`.

Options for category include: 
- animals
- instruments
- machines
- misc

Options for difficulty include: 
- easy
- medium
- hard

## Request Body
Mutation
```
mutation createDeck($category: String!, $difficulty: String!){
    createDeck(input: {
        category: $category,
        difficulty: $difficulty
    })
    {
        deck {
            id
        }
    }
}
```
Variables
```
{
    "category": "misc",
    "difficulty": "easy"
}
```
## Response Body
```
{
    "data": {
        "createDeck": {
            "deck": {
                "id": "238"
            }
        }
    }
}
```