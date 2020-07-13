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
                Text("\(viewModel.themes.currentTheme.name)")
            }
            
            Grid(viewModel.cards) { card  in
                CardView(col1: self.viewModel.themes.currentTheme.color.background,
                        col2: self.viewModel.themes.currentTheme.color.stroke,
                        card: card)
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
        .foregroundColor(viewModel.themes.currentTheme.color.background)     
    }
}

struct CardView: View {
    
        var col1: Color
        var col2: Color
        var gradient: LinearGradient {
            LinearGradient(
                gradient: Gradient(
                    colors: [col2.opacity(0.8), col1.opacity(0.2)]),
                startPoint: .bottom,
                endPoint: .center)
        }
    
    var card: MemoryGame<String>.Card
    
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if  card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockWise: true)
                    .padding(5).opacity(0.4)
                Text(self.card.content)
                    .font(Font.system(size:  fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp, gradient: gradient)
        }
    }
    
    // MARK: - Drawing constants
    private func fontSize(for size: CGSize)-> CGFloat {
        min(size.width, size.height) * 0.65
    }
}




struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        let g = EmojiMemoryGame()
        g.choose(card: g.cards[0])
        return EmojiMemoryGameView(viewModel: g)
    }
}
