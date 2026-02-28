//
//  File.swift
//  CodeBreaker
//
//  Created by Rob Ranf on 2026-02-20.
//

//import Foundation
import SwiftUI

struct Code {
    var kind: Kind
    var pegs: [Peg] = Array(repeating: Code.missing, count: 4)
    
    static let missing: Peg = .clear
    
    enum Kind: Equatable {
        case master
        case guess
        // Associated values, reads as "define an enum type called 'Kind' that can take a value of
        // 'attempt' that has an associated value of type 'array of Match'". Meaning that when
        // 'attempt' is used, it must be of type array of Match.
        case attempt([Match])
        case unknown
    }
    
    var matches: [Match] {
        switch kind {
        case .attempt(let matches): return matches
        default: return []
        }
    }
    
    func match(against otherCode: Code) -> [Match] {
        var results: [Match] = Array(repeating: .nomatch, count: pegs.count)
        var pegsToMatch = otherCode.pegs
        for i in pegs.indices.reversed() {
            if pegsToMatch.count > i, pegsToMatch[i] == pegs[i] {
                results[i] = .exact
                pegsToMatch.remove(at: i)
            }
        }
        for i in pegs.indices {
            if results[i] != .exact {
                if let matchIndex = pegsToMatch.firstIndex(of: pegs[i]) {
                    results[i] = .inexact
                    pegsToMatch.remove(at: matchIndex)
                }
            }
        }
        return results
    }
    
    mutating func randomizeMasterPegs(from pegChoices: [Peg]) {
        for i in pegChoices.indices {
            pegs[i] = pegChoices.randomElement() ?? Code.missing
        }
    }
}
