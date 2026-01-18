struct Player {
  let name: String
  var deck: Deck

  func hasLost() -> Bool {
    return deck.cards.isEmpty
  }
}