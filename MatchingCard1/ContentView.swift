//
//  ContentView.swift
//  MatchingCard1
//
//  Created by winter on 21/7/24.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var cardModelView = CardModelView()
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white,.blue], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()], content: {
                
                ForEach(cardModelView.cards){ card in
                    CardView(card: card).onTapGesture {
                        withAnimation{
                            cardModelView.choose(card: card)
                        }
                    }
                }
                    
            })
        }
    }
}

#Preview {
    ContentView()
}

struct CardView : View {
    
   var card: CardGame.Card
    
    var body: some View{
        ZStack{
            Group{
                RoundedRectangle(cornerRadius: 10).strokeBorder(.blue).frame(width: 50,height: 50)
                RoundedRectangle(cornerRadius: 10).frame(width: 50,height: 50).foregroundStyle(.white)
                Text(card.content)
            }.opacity(card.isPicked ? 1 : 0)
            RoundedRectangle(cornerRadius: 10).frame(width: 50,height: 50).foregroundStyle(.blue).opacity(card.isPicked ? 0 : 1)
        }.opacity(card.isMatched ? 0 : 1)
            .rotation3DEffect(
            .degrees(card.isPicked ? 180 : 0 ),axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}
