//
//  Card.swift
//  MatchingCard1
//
//  Created by winter on 21/7/24.
//

import Foundation

struct CardGame {
    
    var cards: [Card]
    var indexOfOnlyCardPicked: Int?
    var level: Int
    
    struct Card : Identifiable {
        var isPicked = false
        var isMatched = false
        let content: String
        let id = UUID()
    }
    
    init(level: Int, content: (Int)->String){
        self.level = level
        cards = []
        for index in 0..<level*2 {
            cards.append(Card(content: content(index)))
            cards.append(Card(content: content(index)))
        }
        cards = cards.shuffled()
    }
    
    mutating func choose( _ card: Card){
        if let index = cards.firstIndex(where: { $0.id == card.id}), !cards[index].isPicked{
            if let index1 = indexOfOnlyCardPicked{
                if cards[index1].content == card.content {
                    cards[index1].isMatched = true
                    cards[index].isMatched = true
                }
                indexOfOnlyCardPicked = nil
            }else {
                
                for i in cards.indices {
                    cards[i].isPicked = false
                }
                indexOfOnlyCardPicked = index
            }
            cards[index].isPicked.toggle()
        }
    }
    
    func checkForNextLevel() -> Bool {
        return cards.allSatisfy({ card in card.isMatched})
    }
}
