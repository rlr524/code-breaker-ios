//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by Rob Ranf on 2026-02-20.
//

import Foundation

struct CodeBreaker {
    var masterCode: Code
    var guess: Code
    var attempts: [Code]
    var pegChoices: [Peg]
}
