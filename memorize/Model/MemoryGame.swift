//
//  MemoryGame.swift
//  memorize
//
//  Created by Denis Evdokimov on 18.06.2020.
//  Copyright © 2020 Denis Evdokimov. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Hashable {
    var cards: Array<Card>
    var score: Int
    var flippedCard: Set<Int>

    var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter{cards[$0].isFaceUp}.only }
        set {
            for indx in cards.indices {
                cards[indx].isFaceUp = indx == newValue
            }
            
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        score = 0
        cards = [Card]()
        flippedCard = []
    
        for indx in 0 ..< numberOfPairsOfCards {
            let content = cardContentFactory(indx)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
            
        }
        
        cards.shuffle()
    }
    
    mutating func choose(card: Card){
      //  print("card chosen\(card)")
        guard let chosenIndx = cards.firstIndex(matching: card), !cards[chosenIndx].isFaceUp, !cards[chosenIndx].isMatched else {return}
        //flippedCardDict[card.content]! += 1
        if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
            if cards[chosenIndx].content == cards[potentialMatchIndex].content {
                cards[chosenIndx].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                score += 2
            }else {
                score -= flippedCard.intersection([chosenIndx,potentialMatchIndex]).count
            }
            // кликнули по 2й карте и нет совпадения
            flippedCard.insert(potentialMatchIndex)
            flippedCard.insert(chosenIndx)
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
