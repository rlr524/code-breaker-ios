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
    var pegs: [Peg] = [.green, .red, .red, .yellow]
    
    static let missing: Peg = .clear
    
    enum Kind {
        case master
        case guess
        case attempt
        case unknown
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
}
