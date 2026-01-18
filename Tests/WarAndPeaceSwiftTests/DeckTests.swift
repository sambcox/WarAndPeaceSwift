import XCTest
@testable import WarAndPeaceSwift

final class DeckTests: XCTestCase {
  func testDeckInitialization() {
    let deck = Deck(cards: [
      Card(suit: .hearts, value: .two, rank: 2),
      Card(suit: .spades, value: .ace, rank: 14)
    ])

    XCTAssertEqual(deck.cards.count, 2)
    XCTAssertEqual(deck.cards[0].suit, .hearts)
    XCTAssertEqual(deck.cards[1].value, .ace)
  }
}