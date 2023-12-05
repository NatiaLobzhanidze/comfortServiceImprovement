//
//  SquareRadioButton.swift
//  comfort
//
//  Created by natia lobzhanidze on 29.11.23.
//

import SwiftUI

struct SquareRadioButton: View {
    @Binding var isChecked: Bool
    let title: String
    
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                isChecked.toggle()
            }) {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(isChecked ? Color.orange : Color.init(hex: "#151515",
                                                                  alpha: 0.16), lineWidth: 1)
                    .background(isChecked ? Color.orange : Color.white)
                    .frame(width: 20, height: 20)
                    .overlay(
                        Image(systemName: isChecked ? "checkmark" : "")
                            .foregroundColor(.white)
                    )
            }
            Text(title)
                .font(Font.custom("Helvetica Neue LT GEO", size: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.08))
        }
    }
}

struct ContetView: View {
    @State private var isChecked = false
    
    var body: some View {
        VStack {
            Text("Is Checked: \(isChecked.description)")
                .padding()
            
            SquareRadioButton(isChecked: $isChecked, title: "აღარ მაჩვენო")
                .padding()
        }
    }
}

struct ContetView_Previews: PreviewProvider {
    static var previews: some View {
        ContetView()
    }
}

