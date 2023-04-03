# Get the next soundcard in a game
This endpoint requires an argument of `deckId`. When starting a new game you must first [create a deck](/docs/post_deck.md) to generate a `deckId`, then send this request to get each sound card one at a time.
## Example Request Body
Query
```
query ($deckId: ID!){
   soundCard(deckId: $deckId) {
      category
      correctAnswer
      link
      wrongAnswers
   }
}
```
Variables
```
{
    "deckId": "1"
}
```
## Response Body
```
{
    "data": {
        "soundCard": {
            "category": "Animals",
            "correctAnswer": "Elephant",
            "link": "https://cdn.freesound.org/previews/139/139875_2535085-hq.mp3",
            "wrongAnswers": [
                "Water Buffalo",
                "Rhino",
                "Camel"
            ]
        }
    }
}
```