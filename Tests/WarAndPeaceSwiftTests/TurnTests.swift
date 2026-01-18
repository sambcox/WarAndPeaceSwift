import XCTest
@testable import WarAndPeaceSwift

final class TurnTests: XCTestCase {

  func testTurnInitialization() {
    let player1 = Player(name: "Alice", deck: Deck(cards: []))
    let player2 = Player(name: "Bob", deck: Deck(cards: []))
    let turn = Turn(player1: player1, player2: player2)

    XCTAssertEqual(turn.player1.name, "Alice")
    XCTAssertEqual(turn.player2.name, "Bob")
    XCTAssertEqual(turn.spoilsOfWar.count, 0)
  }

  func testDetermineTurnTypeBasic() {
    let player1 = Player(name: "Alice", deck: Deck(cards: [
      Card(suit: .hearts, value: .two, rank: 2)
    ]))
    let player2 = Player(name: "Bob", deck: Deck(cards: [
      Card(suit: .spades, value: .three, rank: 3)
    ]))
    let turn = Turn(player1: player1, player2: player2)

    XCTAssertEqual(turn.type().description, "Basic")
  }


  func testDetermineTurnTypeWar() {
    let player1 = Player(name: "Alice", deck: Deck(cards: [
      Card(suit: .hearts, value: .three, rank: 3),
      Card(suit: .hearts, value: .four, rank: 4),
      Card(suit: .hearts, value: .five, rank: 5)
    ]))
    let player2 = Player(name: "Bob", deck: Deck(cards: [
      Card(suit: .spades, value: .three, rank: 3),
      Card(suit: .spades, value: .six, rank: 6),
      Card(suit: .spades, value: .seven, rank: 7)
    ]))
    let turn = Turn(player1: player1, player2: player2)

    XCTAssertEqual(turn.type().description, "War")
  }

  func testDetermineTurnTypeMutuallyAssuredDestruction() {
    let player1 = Player(name: "Alice", deck: Deck(cards: [
      Card(suit: .hearts, value: .four, rank: 4),
      Card(suit: .hearts, value: .five, rank: 5),
      Card(suit: .hearts, value: .six, rank: 6)
    ]))
    let player2 = Player(name: "Bob", deck: Deck(cards: [
      Card(suit: .spades, value: .four, rank: 4),
      Card(suit: .spades, value: .seven, rank: 7),
      Card(suit: .spades, value: .six, rank: 6)
    ]))
    let turn = Turn(player1: player1, player2: player2)

    XCTAssertEqual(turn.type().description, "Mutually Assured Destruction")
  }
}