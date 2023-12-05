//
//  MainDetailsSheet.swift
//  comfort
//
//  Created by natia lobzhanidze on 30.11.23.
//

import SwiftUI

struct MainDetailsSheet: View {
    @State private var address: String = ""
    @State private var selectedDate: Date = Date()
    @State private var selectedTime: Date = Date()
    @State private var problemDescription: String = ""
    var clickPicker: (() -> ())
    
    var reservationAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            AddressView()
            
            HStack(spacing: 16) {
                TimePickerView(title: "თარიღი")
                    .onTapGesture {
                        clickPicker()
                    }
                
                TimePickerView(title: "საათი")
                    .onTapGesture {
                        clickPicker()
                    }
            }
            
            CommentTextField(
                placeholder: "აღწერე პრობლემა",
                keyboardType: .default
            )
            
            
            CustomButton(
                title: "გამოძახება",
                styleType: .blackBackground,
                isEnabled: true
            ) {
                // Handle reservation button tap
                reservationAction()
            }
        }
        .font(Font.custom("Helvetica Neue LT GEO", size: 14))
        .padding(.horizontal, 20)
    }
}

struct MainDetailsSheet_Previews: PreviewProvider {
    static var previews: some View {
        MainDetailsSheet(clickPicker: {}, reservationAction: {})
    }
}
