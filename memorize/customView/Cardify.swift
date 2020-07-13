//
//  Cardify.swift
//  memorize
//
//  Created by Denis Evdokimov on 10.07.2020.
//  Copyright © 2020 Denis Evdokimov. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier{
    var isFaceUp: Bool
    var gradient: LinearGradient
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth:CGFloat = 3
    func body(content: Content) ->  some View {
        
        ZStack{
            if self.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth:edgeLineWidth)
                content
            } else  {
                RoundedRectangle(cornerRadius: cornerRadius).fill(gradient)
            }
        }
    }
}
extension View {
    func cardify(isFaceUp: Bool, gradient: LinearGradient)-> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, gradient: gradient))
    }
}


