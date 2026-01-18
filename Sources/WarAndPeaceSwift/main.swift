
var fullDeck: [Card] = []

for suit in Suit.allCases {
    for (index, value) in Value.allCases.enumerated() {
        fullDeck.append(
            Card(suit: suit, value: value, rank: index + 1)
        )
    }
}

fullDeck.shuffle()

var player1Deck = Deck(cards: Array(fullDeck.prefix(26)))
var player2Deck = Deck(cards: Array(fullDeck.suffix(26)))

print("Welcome to War! (or Peace)")
print("Please type Player 1's name:")
guard let player1Name = readLine() else {
    fatalError("No input received")
}
var player1 = Player(name: player1Name, deck: player1Deck)
print("Please type Player 2's name:")
guard let player2Name = readLine() else {
    fatalError("No input received")
}
var player2 = Player(name: player2Name, deck: player2Deck)
var turnCount = 0
print("Type 'GO' to start the game!")
guard let startCommand = readLine(), startCommand.uppercased() == "GO" else {
    fatalError("Game not started")
}
while turnCount < 100000 {
  turnCount += 1
  if player1.hasLost() || player2.hasLost() {
    let winner = player1.hasLost() ? player2 : player1
    print("\(winner.name) has won the game!")
    break
  }
  let turn = Turn(player1: player1, player2: player2)
  let turnType = turn.type()
  let winner = turn.winner()
  turn.pileCards()
  switch turnType {
  case .basic:
    if let turnWinner = winner {
      print("Turn \(turnCount): \(turnWinner.name) won \(turn.spoilsOfWar.count) cards")
      turn.awardSpoils(to: turnWinner)
    } else {
      fatalError("Basic turn must have a winner")
    }
  case .war:
    if let turnWinner = winner {
      print("WAR - Turn \(turnCount): \(turnWinner.name) won \(turn.spoilsOfWar.count) cards")
      turn.awardSpoils(to: turnWinner)
    } else {
      fatalError("War turn must have a winner")
    }
  case .mutuallyAssuredDestruction:
      print("Turn \(turnCount): No winner this turn")
  }
}
print ("---- GAME OVER ----")
