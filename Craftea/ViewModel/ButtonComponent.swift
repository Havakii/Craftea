//
//  ButtonComponent.swift
//  Craftea
//
//  Created by Hava Bakrieva on 30/10/2025.
//


import SwiftUI

struct ButtonComponent: View {
    enum ButtonStyleType {
        case filled
        case outlined
    }

    enum ButtonSize {
        case small
        case large
    }

    var text: String
    var style: ButtonStyleType = .filled
    var size: ButtonSize = .large
    var color: Color = .primaryPurpule
    var textColor: Color = .white
    var cornerRadius: CGFloat = 8
    var action: () -> Void

    var body: some View {
        let (width, height, fontSize): (CGFloat, CGFloat, CGFloat) = {
            switch size {
            case .small:
                return (100, 40, 14)
            case .large:
                return (200, 50, 16)
            }
        }()

        Button(action: action) {
            Text(text)
                .font(.system(size: fontSize, weight: .semibold))
                .frame(width: width, height: height)
                .foregroundColor(style == .filled ? textColor : color)
                .background(
                    style == .filled ? color : Color.clear
                )
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(color, lineWidth: style == .outlined ? 2 : 0)
                )
                .cornerRadius(cornerRadius)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        ButtonComponent(
            text: "Hello World",
            style: .outlined,
            size: .small,
            action: {}
        )
    }
    .padding()
}
