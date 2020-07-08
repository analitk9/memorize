//
//  MemoryGame.swift
//  memorize
//
//  Created by Denis Evdokimov on 18.06.2020.
//  Copyright © 2020 Denis Evdokimov. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter{cards[$0].isFaceUp}.only }
        set {
            for indx in cards.indices {
                cards[indx].isFaceUp = indx == newValue
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        cards = Array<Card>()
        for indx in 0 ..< numberOfPairsOfCards {
            let content = cardContentFactory(indx)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        cards.shuffle()
    }
    
    mutating func choose(card: Card){
        print("card chosen\(card)")
        guard let chosenIndx = cards.firstIndex(matching: card), !cards[chosenIndx].isFaceUp, !cards[chosenIndx].isMatched else {return}
        if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
            if cards[chosenIndx].content == cards[potentialMatchIndex].content {
                cards[chosenIndx].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            self.cards[chosenIndx].isFaceUp = true
        } else {
            indexOfOneAndOnlyFaceUpCard = chosenIndx
        }
      
    }
    
    
    
    struct Card: Identifiable {
        var id = UUID()
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
    }
}
