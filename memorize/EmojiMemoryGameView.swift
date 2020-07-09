//
//  ContentView.swift
//  memorize
//
//  Created by Denis Evdokimov on 17.06.2020.
//  Copyright © 2020 Denis Evdokimov. All rights reserved.
//

import SwiftUI


struct EmojiMemoryGameView: View {
  @ObservedObject  var viewModel: EmojiMemoryGame
    var body: some View {
        VStack{
            HStack{
                 Text("Score: \(viewModel.showScore())")
                Spacer()
                Text("\(EmojiMemoryGame.themes.currentTheme.name)")
            }
           
            Grid(viewModel.cards) { card  in
                CardView(card: card)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                }
                .aspectRatio(2/3, contentMode: .fit)
            .padding(3)
            }
            Button(action:{
                self.viewModel.restart()
            } , label: { Text("Start New Game")
            })
        }
        .padding(3)
        .foregroundColor(EmojiMemoryGame.themes.currentTheme.color)
        
       
        
    }
}

struct CardView: View {
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    

    func body(for size: CGSize) -> some View {
      ZStack{
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth:edgeLineWidth)
                Text(self.card.content)
                    
            } else  {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(gradient)
                }
            }
        }
        .font(Font.system(size:  fontSize(for: size)))
    }
    
    // MARK: - Drawing constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth:CGFloat = 3
    func fontSize(for size: CGSize)-> CGFloat {
        min(size.width, size.height) * 0.75
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
