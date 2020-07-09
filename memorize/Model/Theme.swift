//
//  Theme.swift
//  memorize
//
//  Created by Denis Evdokimov on 08.07.2020.
//  Copyright © 2020 Denis Evdokimov. All rights reserved.
//

import Foundation
import SwiftUI

struct Themes {
    private(set) var themes: [Theme]
    var currentTheme: Theme
    init() {
        let theme1 = Theme(name: "hallowin", emoji: ["👹","👽","💀","👻","🎃","🤖"], numberOfPairsOfCards: nil, color: .orange)
        let theme2 = Theme(name: "animals", emoji: ["🐶","🐸","🦁","🐷","🐨","🐯"], numberOfPairsOfCards: Int.random(in: 2...6), color: .green)
        let theme3 = Theme(name: "sport", emoji: ["⚽️","🏀","🏈","⚾️","🏐","🎾"], numberOfPairsOfCards: 4, color: .blue)
        let theme4 = Theme(name: "faces", emoji: ["😀","😡","🤢","🥶","😇","😍"], numberOfPairsOfCards: 5, color: .red)
        let theme5 = Theme(name: "flars", emoji: ["🏁","🇧🇦","🇻🇳","🇷🇺","🇵🇰","🇺🇸"], numberOfPairsOfCards: 3, color: .black)
        let theme6 = Theme(name: "foods", emoji: ["🥐","🥯","🥖","🥩","🍔","🦴"], numberOfPairsOfCards: 2, color: .gray)
        self.themes = [theme1, theme2, theme3, theme4, theme5, theme6]
        self.currentTheme = themes.randomElement()!
    }
    
    mutating func setupNewCurrentTheme(){
        currentTheme = themes.randomElement()!
    }
}

struct Theme {
    let name: String
    let emoji: [String]
    let numberOfPairsOfCards: Int?
    let color: Color
    
}



