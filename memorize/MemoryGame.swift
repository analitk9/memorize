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
    var flippedCardDict: [CardContent: Int]
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
        cards = Array<Card>()
        flippedCardDict = [:]
        for indx in 0 ..< numberOfPairsOfCards {
            let content = cardContentFactory(indx)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
            self.flippedCardDict[content] = 0
        }
        cards.shuffle()
    }
    
    mutating func choose(card: Card){
      //  print("card chosen\(card)")
        guard let chosenIndx = cards.firstIndex(matching: card), !cards[chosenIndx].isFaceUp, !cards[chosenIndx].isMatched else {return}
        flippedCardDict[card.content]! += 1
        if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
            if cards[chosenIndx].content == cards[potentialMatchIndex].content {
                cards[chosenIndx].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                score += 2
               _ = flippedCardDict.removeValue(forKey: card.content)
            }
            self.cards[chosenIndx].isFaceUp = true
            // кликнули по 2 карте и нет совпадения
            score += calcScore()
            
        } else {
            indexOfOneAndOnlyFaceUpCard = chosenIndx
        }
    }
    
    func calcScore()-> Int{
        var count = 0
        let idices =  cards.indices.filter{cards[$0].isFaceUp}
        for indx in idices {
            if let point = flippedCardDict[cards[indx].content]{
                count += point > 1 ? -1 :0
            }
        }
          return count
    }
    
    
    
    struct Card: Identifiable {
        var id = UUID()
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
    }
}
