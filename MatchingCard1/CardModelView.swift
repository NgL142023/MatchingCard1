//
//  CardModelView.swift
//  MatchingCard1
//
//  Created by winter on 21/7/24.
//

import Foundation
class CardModelView: ObservableObject {
    
    private static var level = 1
    private static let icons = ["🥐","🥯","🌭","🍡","🍉","🍎","🍗","🥪","🍺","🍙"]
    @Published var cardGame : CardGame = CardGame(level: level ) { index in
        CardModelView.icons[index]
    }
     
    var cards : [CardGame.Card] {
        return cardGame.cards
    }
    
    func choose (card: CardGame.Card){
        cardGame.choose(card)
        if cardGame.checkForNextLevel() && CardModelView.level < 5{
            CardModelView.level += 1
            cardGame = CardGame(level: CardModelView.level){index in CardModelView.icons[index]}
        }
    }
    
    
}
