//
//  Theme.swift
//  memorize
//
//  Created by Denis Evdokimov on 08.07.2020.
//  Copyright © 2020 Denis Evdokimov. All rights reserved.
//

import Foundation
struct Theme<CardContent> where CardContent: Hashable {
    let name: String
    let emoji: [CardContent]
    let numberOfPairsOfCards: Int?
    let color: ColorForTheme
    
}


enum ColorForTheme: String{
    case Orange, Blue, Red, Green, Grey, Black
}
