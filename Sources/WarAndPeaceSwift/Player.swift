class Player {
  let name: String
  var deck: Deck

  init (name: String, deck: Deck) {
    self.name = name
    self.deck = deck
  }

  func hasLost() -> Bool {
    return deck.cards.isEmpty
  }
}