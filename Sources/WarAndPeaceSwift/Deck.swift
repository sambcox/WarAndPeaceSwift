struct Deck {
  var cards: [Card]

  func rankOfCardAt(index: Int) -> Int {
    return cards[index].rank
  }

  func highRankingCards() -> [Card] {
    return cards.filter { $0.rank >= 11 }
  }

  func percentageOfHighRankingCards() -> Double {
    let highRankingCount = Double(highRankingCards().count)
    let totalCount = Double(cards.count)
    return (highRankingCount / totalCount) * 100
  }

  mutating func removeCard() -> Card? {
    guard !cards.isEmpty else { return nil }
    return cards.removeFirst()
  }

  mutating func addCard(_ card: Card) {
    cards.append(card)
  }
}