import XCTest
@testable import WarAndPeaceSwift

final class PlayerTests: XCTestCase {

  func testPlayerInitialization() {
    let player = Player(name: "Alice", deck: Deck(cards: []))

    XCTAssertEqual(player.name, "Alice")
    XCTAssertEqual(player.deck.cards.count, 0)
  }

  func testHasLostWhenDeckIsEmpty() {
    let playerWithCards = Player(name: "Bob", deck: Deck(cards: [Card(suit: .hearts, value: .two, rank: 2)]))
    let playerWithoutCards = Player(name: "Charlie", deck: Deck(cards: []))

    XCTAssertFalse(playerWithCards.hasLost())
    XCTAssertTrue(playerWithoutCards.hasLost())
  }
}