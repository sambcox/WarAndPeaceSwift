import XCTest
@testable import WarAndPeaceSwift

final class CardTests: XCTestCase {

  func testCardProperties() {
    let card = Card(suit: .spades, value: .queen, rank: 12)

    XCTAssertEqual(card.suit, .spades)
    XCTAssertEqual(card.value, .queen)
    XCTAssertEqual(card.rank, 12)
  }

  func testSuitSymbol() {
    XCTAssertEqual(Suit.hearts.symbol, "♥︎")
    XCTAssertEqual(Suit.diamonds.symbol, "♦︎")
    XCTAssertEqual(Suit.clubs.symbol, "♣︎")
    XCTAssertEqual(Suit.spades.symbol, "♠︎")
  }

  func testValueRawValue() {
    XCTAssertEqual(Value.two.rawValue, "2")
    XCTAssertEqual(Value.ten.rawValue, "10")
    XCTAssertEqual(Value.jack.rawValue, "Jack")
    XCTAssertEqual(Value.ace.rawValue, "Ace")
  }

  func testCardPrintsCorrectly() {
    let card = Card(suit: .hearts, value: .ace, rank: 14)
    let cardDescription = "\(card.value.rawValue) of \(card.suit.symbol)"
    XCTAssertEqual(cardDescription, "Ace of ♥︎")
  }
}

