//
//  CodeBreakerView.swift
//  CodeBreaker
//
//  Created by Rob Ranf on 2026-01-20.
//

import SwiftUI

struct CodeBreakerView: View {
    let game = CodeBreaker()
    
    var body: some View {
        VStack {
            pegs(colors: [.red, .blue, .green, .customColorPurple])
            pegs(colors: [.red, .yellow, .green, .green])
            pegs(colors: [.blue, .blue, .red, .blue])
            pegs(colors: [.blue, .blue, .red, .blue])
            pegs(colors: [.blue, .blue, .red, .blue])
            pegs(colors: [.blue, .blue, .red, .blue])
            pegs(colors: [.blue, .blue, .red, .blue])
            pegs(colors: [.blue, .blue, .red, .blue])
            pegs(colors: [.blue, .blue, .red, .blue])
        }
        .padding()
    }
    
    func pegs(colors: Array<Color>) -> some View {
        HStack {
            MatchMarkersView(matches: [.exact, .inexact, .nomatch, .exact])
            
            ForEach(colors.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[index])
            }
        }
    }
}



#Preview {
    CodeBreakerView()
}
