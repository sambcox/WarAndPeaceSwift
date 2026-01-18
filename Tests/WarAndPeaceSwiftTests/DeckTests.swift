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

  func testRankOfCardAt() {
    let deck = Deck(cards: [
      Card(suit: .hearts, value: .three, rank: 3),
      Card(suit: .clubs, value: .king, rank: 13)
    ])

    XCTAssertEqual(deck.rankOfCardAt(index: 0), 3)
    XCTAssertEqual(deck.rankOfCardAt(index: 1), 13)
  }

  func testHighRankingCards() {
    let deck = Deck(cards: [
      Card(suit: .hearts, value: .jack, rank: 11),
      Card(suit: .diamonds, value: .seven, rank: 7),
      Card(suit: .spades, value: .queen, rank: 12)
    ])

    let highRanking = deck.highRankingCards()
    XCTAssertEqual(highRanking.count, 2)
    XCTAssertTrue(highRanking.contains { $0.value == .jack })
    XCTAssertTrue(highRanking.contains { $0.value == .queen })
  }

  func testPercentageOfHighRankingCards() {
    let deck = Deck(cards: [
      Card(suit: .hearts, value: .jack, rank: 11),
      Card(suit: .diamonds, value: .seven, rank: 7),
      Card(suit: .spades, value: .queen, rank: 12)
    ])

    let percentage = deck.percentageOfHighRankingCards()
    XCTAssertEqual(percentage, (2.0 / 3.0) * 100.0)
  }

  func testRemoveCard() {
    var deck = Deck(cards: [
      Card(suit: .hearts, value: .two, rank: 2),
      Card(suit: .clubs, value: .three, rank: 3)
    ])

    let removedCard = deck.removeCard()
    XCTAssertEqual(removedCard?.value, .two)
    XCTAssertEqual(deck.cards.count, 1)
    XCTAssertEqual(deck.cards[0].value, .three)
  }

  func testAddCard() {
    var deck = Deck(cards: [
      Card(suit: .hearts, value: .four, rank: 4)
    ])

    let newCard = Card(suit: .spades, value: .ace, rank: 14)
    deck.addCard(newCard)

    XCTAssertEqual(deck.cards.count, 2)
    XCTAssertEqual(deck.cards[1].value, .ace)
  }
}