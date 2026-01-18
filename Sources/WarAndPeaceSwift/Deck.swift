struct Deck {
  let cards: [Card]

  func rankOfCardAt(index: Int) -> Int {
    return cards[index].rank
  }
}