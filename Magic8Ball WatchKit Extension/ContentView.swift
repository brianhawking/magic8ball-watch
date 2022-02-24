//
//  ContentView.swift
//  Magic8Ball WatchKit Extension
//
//  Created by Brian Veitch on 2/23/22.
//

import SwiftUI

struct ContentView: View {
    @State var fill: CGFloat = 0
    @GestureState var press = false
    @State var show = false
    
    var answers = [
        "It is certain",
        "Without a doubt",
        "Yes, definitely",
        "Most likely",
        "Outlook good",
        "Yes",
        "Reply hazy, try again later",
        "Ask again later",
        "Better not tell you now",
        "Don't count on it",
        "My sources say no",
        "Very doubtful"
    ]

    var body: some View {
        
        ZStack {
            
            if show == false {
                Image("fingerprint")
                    .resizable()
                    .frame(width: 100, height: 120, alignment: .center)
                
                Circle()
                    .stroke(.white.opacity(0.3), lineWidth: 5)
                
                Circle()
                    .trim(from: 0, to: fill)
                    .stroke(.yellow, lineWidth: 5)
                    .animation(Animation.easeOut(duration: 4))
            }
            else {
                let randomNumber = Int.random(in: 0..<answers.count)
                
                ZStack {
                    let text = answers[randomNumber]
                    let offset = CGFloat(-text.count)-10
                    Triangle().foregroundColor(.blue)
                    Text(text)
                        .frame(width: 100, alignment: .center)
                        .offset(y: offset)
                }
            }
        }
        .padding(10)
        .onTapGesture {
            fill = 1
            
            Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { _ in
                show = true
                
                Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
                    show = false
                    self.fill = 0
                }
            }
        }
        
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // lines of path
        
        // start at top middle
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        // move to bottom left
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        // move to bottom right
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        // end at top middle
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
