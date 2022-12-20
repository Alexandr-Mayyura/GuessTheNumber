//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Aleksandr Mayyura on 19.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = Float.random(in: 1...100)
    @State private var targetValue = Float.random(in: 1...100)
    @State private var alphaValue: CGFloat = 1
    @State private var isAlertShow = false
    
    var body: some View {
        VStack {
            Text("Подставьте слайдер, как можно ближе к: \(Int(targetValue))")
            HStack {
                Text("0")
                SliderView(value: $currentValue, alpha: $alphaValue)
                    .onChange(of: currentValue) { _ in
                        changeAlpha()
                    }
                Text("100")
            }
            Button("Проверь меня!") {
                isAlertShow.toggle()
            }
            .alert(
                "Your score\n \(computeScore())",
                isPresented: $isAlertShow,
                actions: {}
            )
                .padding()
            Button("Начать заново", action: {
                currentValue = Float.random(in: 1...100)
                targetValue = Float.random(in: 1...100)
            })
        }
        .padding()
        .onAppear {
            changeAlpha()
        }
    }
    
    private func changeAlpha() {
        alphaValue = CGFloat(computeScore()) / 100
    }

    private func computeScore() -> Int {
        let difference = abs(Int(targetValue) - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
