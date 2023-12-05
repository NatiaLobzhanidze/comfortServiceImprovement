//
//  CustomButton.swift
//  comfort
//
//  Created by natia lobzhanidze on 05.12.23.
//

import SwiftUI

enum CustomButtonStyleType {
    case blackBackground
    case whiteBackgroundWithBorder
    case whiteBackground
}

struct CustomButton: View {
    var title: String
    var styleType: CustomButtonStyleType
    var isEnabled: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(style.foregroundColor)
                .frame(maxWidth: .infinity)
                .padding(16)
                .opacity(isEnabled ? 1.0 : 0.5)
        }
        .buttonStyle(style)
        .disabled(!isEnabled)
    }

    private var style: CustomButtonStyle {
        switch styleType {
        case .blackBackground:
            return .init(backgroundColor: Color("BlackBtnColor"), foregroundColor: Color("ButtonTitleColor"))
        case .whiteBackgroundWithBorder:
            return .init(backgroundColor: .white, foregroundColor: .black, borderColor: .black)
        case .whiteBackground:
            return .init(backgroundColor: .white, foregroundColor: .red)
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    var borderColor: Color?

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(foregroundColor)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .background(backgroundColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor ?? Color.clear, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
    }
}
