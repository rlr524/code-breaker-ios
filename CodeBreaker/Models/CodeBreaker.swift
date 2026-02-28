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
    let pegChoices: [Peg]
    
    init(pegchoices: [Peg] = [.red, .green, .yellow, .blue]) {
        self.pegChoices = pegchoices
        masterCode.randomizeMasterPegs(from: pegChoices)
        print(masterCode)
    }
    
    mutating func attemptGuess() {
        var attempt = guess
        attempt.kind = .attempt(guess.match(against: masterCode))
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
