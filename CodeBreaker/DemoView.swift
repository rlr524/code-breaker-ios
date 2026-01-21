//
//  DemoView.swift
//  CodeBreaker
//
//  Created by Rob Ranf on 2026-01-05.
//

import SwiftUI

struct DemoView: View {
    var i: Int = 0
    var s: String = ""
    var sayGreetings: Bool = false
    
    var body: some View {
        //        VStack(alignment: .leading, spacing: 10, content: greetings)
        //            .padding()
        
        VStack {
            Image(systemName: "globe").foregroundStyle(.purple)
            if sayGreetings {
                Text("Greetings").foregroundStyle(.green)
            }
            Text("Hello").foregroundStyle(.cyan)
            Circle()
        }
        .font(.largeTitle)
    }
    
    //    @ViewBuilder
    //    func greetings() -> TupleView<(Image, Text, Circle)> {
    //        Image(systemName: "globe")
    //        Text("Greetings!")
    //        Circle()
    //    }
    
    /**
     Better than the above function, demonstrates what "some View" means, which is that some view is simply a "bag of lego bricks" wherein a lego brick is a single instance of something that conforms to the View protocol.
     */
    //    @ViewBuilder
    //    func greetings() -> some View {
    //        Image(systemName: "globe")
    //        if sayGreetings {
    //            Text("Greetings")
    //        }
    //        Text("Hello")
    //        Circle()
    //    }
    
    /**
     We can't pass this to the "content" param in VStack or any other view because that content param requires something that conforms to view and String does not conform to View.
     */
    //    func newGreetings() -> String {
    //        return "Greetings!"
    //    }
}

#Preview {
    DemoView()
}
