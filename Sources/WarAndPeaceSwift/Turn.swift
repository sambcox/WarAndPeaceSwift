enum TurnType {
    case basic
    case war
    case mutuallyAssuredDestruction

  var description: String {
        switch self {
        case .basic:
            return "Basic"
        case .war:
            return "War"
        case .mutuallyAssuredDestruction:
            return "Mutually Assured Destruction"
        }
  }
}

class Turn {
  var player1: Player
  var player2: Player
  var spoilsOfWar: [Card]

  init (player1: Player, player2: Player) {
    self.player1 = player1
    self.player2 = player2
    self.spoilsOfWar = []
  }

  func type() -> TurnType {
    guard
        let player1Card = player1.deck.cards.first,
        let player2Card = player2.deck.cards.first
    else {
        return .basic
    }

    if player1Card.rank != player2Card.rank {
        return .basic
    }

    if player1.deck.cards.count >= 3 &&
       player2.deck.cards.count >= 3 &&
       player1.deck.cards[2].rank == player2.deck.cards[2].rank {
        return .mutuallyAssuredDestruction
    }

    return .war
  }

  func winner() -> Player? {
    let turnType = type()

    switch turnType {
    case .basic:
      if let player1Card = player1.deck.cards.first, let player2Card = player2.deck.cards.first {
          return player1Card.rank > player2Card.rank ? player1 : player2
      } else {
          fatalError("Player deck is empty")
      }
    case .war:
      return player1.deck.cards[2].rank > player2.deck.cards[2].rank ? player1 : player2
    case .mutuallyAssuredDestruction:
      return nil
    }
  }

  func pileCards() {
    let turnType = type()

    switch turnType {
    case .basic:
      spoilsOfWar.append(player1.deck.removeCard()!)
      spoilsOfWar.append(player2.deck.removeCard()!)
    case .war:
      for _ in 0..<3 {
        spoilsOfWar.append(player1.deck.removeCard()!)
        spoilsOfWar.append(player2.deck.removeCard()!)
      }
    case .mutuallyAssuredDestruction:
      for _ in 0..<3 {
        _ = player1.deck.removeCard()
        _ = player2.deck.removeCard()
      }
    }
  }

  func awardSpoils(to winner: Player) {
    for card in spoilsOfWar {
      winner.deck.addCard(card)
    }
    spoilsOfWar.removeAll()
  }
}