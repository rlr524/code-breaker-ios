//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by Rob Ranf on 2026-02-20.
//

//import Foundation
import SwiftUI

struct CodeBreaker {
    var masterCode = Code(kind: .master)
    var guess = Code(kind: .guess)
    var attempts = [Code]()
    let pegChoices: [Color] = [.red, .green, .blue, .yellow]
    
    mutating func attemptGuess() {
        var attempt = guess
        attempt.kind = .attempt
        //attempts.append(attempt)
        attempts.insert(attempt, at: 0)
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPeg = pegChoices[(indexOfExistingPegInPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missing
        }
        
    }
}

