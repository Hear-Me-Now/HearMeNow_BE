# Create a new deck
This is the mutation that must be called in order to initialize a game, once the deck is created you will use the deck_id to [request each soundcard](/docs/get_soundcard.md) one at a time.
This request requires an argument of category options for category include: 
- animals
- instruments
- machines
- misc
## Request Body
Mutation
```
mutation createDeck($category: String!){
    createDeck(input: {
        category: $category
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
    "category": "misc"
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