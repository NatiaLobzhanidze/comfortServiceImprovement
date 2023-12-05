//
//  PickerView.swift
//  comfort
//
//  Created by natia lobzhanidze on 30.11.23.
//

import SwiftUI

struct TimePickerView: View {
    let title: String
    var body: some View {
        
        HStack(alignment: .center) {
            Text(title)
                .font(Font.custom("Helvetica Neue LT GEO", size: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2).opacity(0.5))
                .padding(.trailing, 12)
            
            Spacer()
            
            Image("arrow_down_ic")
                .padding(.trailing, 14)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 4)
        .frame(maxWidth: .infinity,
               minHeight: 60,
               maxHeight: 60,
               alignment: .center)
        .background(Color(red: 0.14,
                          green: 0.18,
                          blue: 0.2).opacity(0.05))
        .cornerRadius(8)
    }
}

struct TimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerView(title: "თარიღი")
    }
}
