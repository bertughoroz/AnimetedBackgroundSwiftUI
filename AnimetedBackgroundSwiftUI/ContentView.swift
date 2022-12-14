//
//  ContentView.swift
//  AnimetedBackgroundSwiftUI
//
//  Created by Bertuğ Horoz on 14.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            AnimatedBackground().edgesIgnoringSafeArea(.all)
                .blur(radius: 50)
                .opacity(1)
        }
        .foregroundColor(Color(.black))
        
    }
}

struct AnimatedBackground : View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [Color.blue, Color.red, Color.purple, Color.pink, Color.yellow, Color.green, Color.orange]
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .animation(Animation.easeInOut(duration: 6).repeatForever())
            .onReceive(timer) { _ in
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -4, y: 20)
                self.start = UnitPoint(x: 4, y: 0)
            }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
