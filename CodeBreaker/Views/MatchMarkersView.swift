//
//  MatchMarkersView.swift
//  CodeBreaker
//
//  Created by Rob Ranf on 2026-01-21.
//

import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}


struct MatchMarkersView: View {
    var matches: Array<Match>
    
    var body: some View {
        HStack {
            VStack {
                matchMarker(peg: 0)
                Text("0")
                matchMarker(peg: 1)
                Text("1")
            }
            VStack {
                matchMarker(peg: 2)
                Text("2")
                matchMarker(peg: 3)
                Text("3")
            }
        }
    }
    
    @ViewBuilder
    func matchMarker(peg: Int) -> some View {
        // How many times .exact appears in the matches array
        let exactCount = matches.count { $0 == .exact }
        // How many times .exact OR .inexact appears in the matches array
        let foundCount = matches.count { $0 != .nomatch }
        Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    MatchMarkersView(matches: [.exact, .exact, .inexact, .nomatch])
}
