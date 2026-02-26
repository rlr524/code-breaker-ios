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
            viewCodes(for: game.masterCode)
            viewCodes(for: game.guess)
        }
        .padding()
    }
    
    func viewCodes(for code: Code) -> some View {
        HStack {
            MatchMarkersView(matches: [.exact, .inexact, .nomatch, .exact])
            
            ForEach(code.pegs.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[index])
            }
        }
    }
}



#Preview {
    CodeBreakerView()
}
