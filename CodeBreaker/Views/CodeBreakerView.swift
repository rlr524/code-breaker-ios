//
//  CodeBreakerView.swift
//  CodeBreaker
//
//  Created by Rob Ranf on 2026-01-20.
//

import SwiftUI

struct CodeBreakerView: View {
    @State var game = CodeBreaker(pegchoices: [.brown, .yellow, .black, .orange])
    
    var body: some View {
        VStack {
            // Invoke viewCodes function for master codes row.
            viewCodes(for: game.masterCode)
            
            // Invoke viewCodes function for guesses row.
            viewCodes(for: game.guess)
            
            ScrollView {
                // Invoke viewCodes function for previous attempts rows by iterating
                // over the array of attempts that is handled in the CodeBreaker model.
                ForEach(game.attempts.indices, id: \.self) { index in
                    viewCodes(for: game.attempts[index])
                }
            }
        }
        .padding()
    }
    
    var guessButton: some View {
        Button("Guess", systemImage: "checkmark.circle") {
            withAnimation {
                game.attemptGuess()
            }
        }
        .font(.system(size: K.iconFontSize))
        .foregroundStyle(.black)
        .labelStyle(.iconOnly)
    }
    
    var questionButton: some View {
        Button("Master Code", systemImage: "questionmark.circle") {}
            .font(.system(size: K.iconFontSize))
            .labelStyle(.iconOnly)
            .foregroundStyle(.black)
    }
    
    func viewCodes(for code: Code) -> some View {
        HStack {
            MatchMarkersView(matches: code.matches)
                .overlay {
                    if code.kind == .guess {
                        guessButton
                    } else if code.kind == .master {
                        questionButton
                    }
                }
            
            ForEach(code.pegs.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .overlay {
                        if code.pegs[index] == Code.missing {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2.0)
                        }
                    }
                    .contentShape(Rectangle())
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
