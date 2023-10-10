//
//  ContentView.swift
//  HelloWorldSwiftUI
//
//  Created by Артемий Дериглазов on 02.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var greenCircleOpacity = 0.3
    @State var yellowCircleOpacity = 1.0
    @State var redCircleOpacity = 0.3

    @State var buttonTitle = "START"
    
    var body: some View {
        ZStack {
            Color
                .black
                .ignoresSafeArea()

            VStack {
                trafficLightCircles
                    .padding(56)
                
                Button(action:{
                    goBrightNextColor()
                    buttonTitle = "NEXT"
                }) {
                    Text(buttonTitle)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 120, height: 50)
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 4)
                                )
                        )
                }
            }
            .frame(width: 200)
        }
    }
    
    private var trafficLightCircles: some View {
        VStack(spacing: 20) {
            CircleWithOutline(color: .red, opacity: redCircleOpacity)
            CircleWithOutline(color: .yellow, opacity: yellowCircleOpacity)
            CircleWithOutline(color: .green, opacity: greenCircleOpacity)
        }
    }
    
    private func goBrightNextColor() {
        if greenCircleOpacity == 0.3 && yellowCircleOpacity == 0.3 {
            yellowCircleOpacity = 1
            redCircleOpacity = 0.3
        } else if yellowCircleOpacity == 1 {
            greenCircleOpacity = 1
            yellowCircleOpacity = 0.3
        } else {
            redCircleOpacity = 1
            greenCircleOpacity = 0.3
        }
    }
}

struct CircleWithOutline: View {
    var color: Color
    var opacity: Double
    
    var body: some View {
            Circle()
            .fill(color.opacity(opacity))
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 5)
                )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
