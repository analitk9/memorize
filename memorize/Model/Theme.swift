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
    private(set) var currentTheme: Theme
    init() {
        let theme1 = Theme(name: "hallowin", emoji: ["👹","👽","💀","👻","🎃","🤖"],
                           numberOfPairsOfCards: nil, color: (background:  Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), stroke: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))))
        let theme2 = Theme(name: "animals", emoji: ["🐶","🐸","🦁","🐷","🐨","🐯"],
                           numberOfPairsOfCards: Int.random(in: 2...6), color: (background:  Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), stroke: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))))
        let theme3 = Theme(name: "sport", emoji: ["⚽️","🏀","🏈","⚾️","🏐","🎾"],
                           numberOfPairsOfCards: 4, color: (background:  Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), stroke: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))))
        let theme4 = Theme(name: "faces", emoji: ["😀","😡","🤢","🥶","😇","😍"],
                           numberOfPairsOfCards: 5, color: (background:  Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)), stroke: Color(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))))
        let theme5 = Theme(name: "flars", emoji: ["🏁","🇧🇦","🇻🇳","🇷🇺","🇵🇰","🇺🇸"],
                           numberOfPairsOfCards: 3, color: (background:  Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), stroke: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))))
        let theme6 = Theme(name: "foods", emoji: ["🥐","🥯","🥖","🥩","🍔","🦴"],
                           numberOfPairsOfCards: 2, color: (background:  Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), stroke: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))))
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
    let color: (background: Color, stroke: Color)
    
}



