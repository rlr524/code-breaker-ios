//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by Rob Ranf on 2026-02-20.
//

//import Foundation
import SwiftUI

struct CodeBreaker {
    var masterCode: Code = Code(kind: .master)
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = [Code]()
    let pegChoices: [Peg] = [.red, .green, .blue, .yellow]
    
}
