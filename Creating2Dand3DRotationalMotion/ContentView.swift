//
//  ContentView.swift
//  Creating2Dand3DRotationalMotion
//
//  Created by ramil on 08.11.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var drawPath = false
    @State private var movePaperplane = false
    @State private var threeDRotate = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue]), center: .center, startRadius: 2, endRadius: 500)
                .scaleEffect(1.2)
            Circle()
                .trim(from: 0, to: drawPath ? 1 : 0)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 5, dash: [10]))
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(180))
                //.blur(radius: 2, opaque: true)
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                .onAppear() {
                    self.drawPath.toggle()
            }
            Image(systemName: "paperplane.fill") // Paperplane
                .rotation3DEffect(.degrees(threeDRotate ? -360 : 360), axis: (x: 0, y: threeDRotate ? -1 : -5, z: 0))
                .offset(x: -150)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .rotationEffect(.degrees(movePaperplane ? 0 : -360))
                .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                .onAppear(){
                    self.movePaperplane.toggle()
                    self.threeDRotate.toggle()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
