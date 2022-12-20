//
//  SliderView.swift
//  GuessTheNumber
//
//  Created by Aleksandr Mayyura on 19.12.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
   @Binding var value: Float
   @Binding var alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.value = value
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .allEvents
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func changeValue(_ sender: UISlider) {
            value = sender.value
        }
    }
}
