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
                matchMarker(peg: 1)
            }
            VStack {
                matchMarker(peg: 2)
                matchMarker(peg: 3)
            }
        }
    }
    
    func matchMarker(peg: Int) -> some View {
        let exactCount: Int = matches.count(where: { match in match == .exact })
        let foundCount: Int = matches.count(where: { match in match != .nomatch })
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    MatchMarkersView(matches: [.exact, .inexact, .nomatch])
}
