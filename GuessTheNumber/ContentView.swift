//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Aleksandr Mayyura on 19.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = Float.random(in: 1...100)
    @State private var targetValue = Int.random(in: 1...100)
    @State private var opacityValue = 1.0
    @State private var isShowAlert = false
    
    var body: some View {
        VStack {
            Text("Подставьте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                SliderView(value: $currentValue, opacity: $opacityValue)
                    .onChange(of: currentValue) { _ in
                        changeOpacityValue()
                    }
                Text("100")
            }
            Button("Проверь меня!") {
                isShowAlert.toggle()
            }
            .alert(
                "Your score\n \(computeScore())",
                isPresented: $isShowAlert,
                actions: {}
            )
                .padding()
            Button("Начать заново") {
                currentValue = .random(in: 1...100)
                targetValue = .random(in: 1...100)
            }
        }
        .padding()
        .onAppear {
            changeOpacityValue()
        }
    }
    
    private func changeOpacityValue() {
        opacityValue = Double(computeScore()) / 100
    }

    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
