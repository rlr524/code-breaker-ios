//
//  CodeBreakerView.swift
//  CodeBreaker
//
//  Created by Rob Ranf on 2026-01-20.
//

import SwiftUI

struct CodeBreakerView: View {
    @State var game = CodeBreaker()
    
    var body: some View {
        VStack {
            // Invoke viewCodes function for master codes row.
            viewCodes(for: game.masterCode)
            
            ScrollView {
                // Invoke viewCodes function for guesses row.
                viewCodes(for: game.guess)
                // Invoke viewCodes function for previous attempts rows by iterating over the
                // array of attempts that is handled in the CodeBreaker model.
                ForEach(game.attempts.indices, id: \.self) { index in
                    viewCodes(for: game.attempts[index])
                }
            }
            Button("Guess") {
                withAnimation {
                    game.attemptGuess()
                }
            }
        }
        .padding()
    }
    
    func viewCodes(for code: Code) -> some View {
        HStack {
            MatchMarkersView(matches: code.match(against: game.masterCode))
            
            ForEach(code.pegs.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[index])
                    .onTapGesture {
                        if code.kind == .guess {
                            game.changeGuessPeg(at: index)
                        }
                    }
            }
        }
    }
}



#Preview {
    CodeBreakerView()
}
