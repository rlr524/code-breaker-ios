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
}
