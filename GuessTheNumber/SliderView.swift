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
        slider.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: alpha)
        slider.value = value
        slider.addTarget(context.coordinator, action: #selector(Coordinator.actionSlider), for: .allEvents)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        uiView.alpha = alpha
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, alpha: $alpha)
    }
    
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var value: Float
        @Binding var alpha: CGFloat
        
        init(value: Binding<Float>, alpha: Binding<CGFloat>) {
            self._value = value
            self._alpha = alpha
        }
        
        @objc func actionSlider(_ sender: UISlider) {
            value = sender.value
            alpha = sender.alpha
        }
    }
}
