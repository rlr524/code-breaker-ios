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
    
    enum Kind {
        case master
        case guess
        case attempt
        case unknown
    }
}
