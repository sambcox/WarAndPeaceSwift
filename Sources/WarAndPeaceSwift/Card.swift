enum Suit: CaseIterable {
    case hearts, diamonds, clubs, spades

    var symbol: String {
        switch self {
        case .hearts: return "♥︎"
        case .diamonds: return "♦︎"
        case .clubs: return "♣︎"
        case .spades: return "♠︎"
        }
    }
}


enum Value: String, CaseIterable {
    case two = "2", three = "3", four = "4"
    case five = "5", six = "6", seven = "7", eight = "8"
    case nine = "9", ten = "10"
    case jack = "Jack", queen = "Queen", king = "King", ace = "Ace"
}

struct Card {
    let suit: Suit
    let value: Value
    let rank: Int
}