//
//  TextfieldView.swift
//  comfort
//
//  Created by natia lobzhanidze on 30.11.23.
//

import SwiftUI

struct CustomTextField: View {
    @ScaledMetric var heigh = 48
    @ScaledMetric var iconSize = 20
    @State var text: String = ""
    @State var placeholder: String
    @State var placeholderBool = false
    var keyboardType: UIKeyboardType
    var showIcon: Bool
    var backgroundColor: Color = Color(hex: "#232E340", alpha: 0.05)
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            HStack(spacing: 10) {
                if showIcon {
                    Image("location_ic")
                        .foregroundColor(Color(hex: "#232E34", alpha: 1))
                        .frame(width: iconSize, height: iconSize)
                        .padding(.leading, 20)
                }
                Text(placeholder)
                    .foregroundColor(Color(hex: "#232E34", alpha: 0.5))
                    .font(Font.custom("Helvetica Neue LT GEO", size: placeholderBool ? 12 : 14))
                    .offset(y: placeholderBool ? -17 : 0 )
                    .padding(.leading, showIcon ? 0 : 12)
            }
            
            TextField("", text: $text, onEditingChanged: { change in
                withAnimation {
                    placeholderBool = change || !text.isEmpty
                }
            })
            .foregroundColor(Color(hex: "#232E34", alpha: 1))
            .font(.system(size: 14, weight: .semibold))
            .keyboardType(keyboardType)
            .frame(height: heigh)
            .multilineTextAlignment(.leading)
            .padding(.horizontal, showIcon ? 44 : 12)
            .padding(.vertical, 5)
            .foregroundColor(.black)
        }
        .background(backgroundColor)
        .cornerRadius(8)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            placeholder: "შენი მისამართი",
            keyboardType: .default,
            showIcon: false)
    }
}

