//
//  CommentTextField.swift
//  comfort
//
//  Created by natia lobzhanidze on 05.12.23.
//

import SwiftUI

struct CommentTextField: View {
    @ScaledMetric var height = 48
    @State var text: String = ""
    @State var placeholder: String
    @State var placeholderBool = false
    @State var placeholderOffset: CGFloat = 0
    @State var placeholderFontSize: CGFloat = 14
    
    var keyboardType: UIKeyboardType
    
    var body: some View {
        
        ZStack(alignment: .leading) {
                Text(placeholder)
                    .foregroundColor(Color(hex: "#232E34", alpha: 0.5))
                    .font(.system(size: (placeholderBool ? 12 : 14)))
                    .offset(y: placeholderBool ? -17 : 0 )
            
            TextField("", text: $text, onEditingChanged: { change in
                withAnimation {
                    placeholderBool = change || !text.isEmpty
                }
            })
            .foregroundColor(Color(hex: "#232E34", alpha: 1))
            .font(.system(size: 14, weight: .semibold))
            .keyboardType(keyboardType)
            .frame(height: height)
            .multilineTextAlignment(.leading)
            .padding(.vertical, 5)
            .foregroundColor(.black)
        }
        .padding(.horizontal, 12)
        .background(Color(hex: "#232E340", alpha: 0.05))
    .cornerRadius(8)
}
}

struct CommentTextField_Previews: PreviewProvider {
    static var previews: some View {
        CommentTextField(placeholder: "აღწერე პრობლემა",
                         keyboardType: .default)
    }
}
