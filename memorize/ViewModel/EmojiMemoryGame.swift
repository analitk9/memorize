//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Denis Evdokimov on 18.06.2020.
//  Copyright © 2020 Denis Evdokimov. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
  
   @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
       
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["😡","🤤","🥶","💩","🤖"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)){ indx in emojis[indx] }
    }
    
   // var objectWillChange: ObservableObjectPublisher
        
    
    // MARK: - Access to Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s) намерения
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    func showScore()-> Int {
        model.score
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}
