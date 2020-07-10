//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Denis Evdokimov on 18.06.2020.
//  Copyright © 2020 Denis Evdokimov. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
  
   @Published private var model: MemoryGame<String>
   
    private(set) var themes = Themes()
 
    init() {
        model = EmojiMemoryGame.createMemoryGame(theme: themes.currentTheme)
    }
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emoji //["😡","🤤","🥶","💩","🤖"]
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards ?? Int.random(in: 2...emojis.count)){ indx in emojis[indx] }
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
        themes.setupNewCurrentTheme()
        model = EmojiMemoryGame.createMemoryGame(theme: themes.currentTheme)
        
    }
    
}
