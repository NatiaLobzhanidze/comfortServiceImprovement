//
//  SuccessResultView.swift
//  comfort
//
//  Created by natia lobzhanidze on 01.12.23.
//

import SwiftUI

struct SuccessResultView: View {
    var buttonAction: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            ResultView(state: .success)

            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("SeparatorLineColor"))
            
            VStack(spacing: 13){
                titleSubtitleHView(with: "მისამართი", and: "თბილისი, საქართველო")
                titleSubtitleHView(with: "დაჯავშნის დრო", and: "10 დეკემბერი, 2023, 12:00")
                titleSubtitleHView(with: "გამოძახების დრო", and: "10 დეკემბერი, 2023, 12:00")
                titleSubtitleHView(with: "პრობლემა", and: "მანქანას აქვს პერებოი")
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("SeparatorLineColor"))
            VStack(spacing: 0) {
                CustomButton(title: "მთავარზე დაბრუნება", styleType: .blackBackground, isEnabled: true, action: {
                    buttonAction()
                })
                
                CustomButton(title: "გაუქმება", styleType: .whiteBackground, isEnabled: true, action: {
                    buttonAction()
                })
            }
       
        }
        .padding(.horizontal, 20)
        .cornerRadius(16)
    }
    
    private func titleSubtitleHView(with title: String, and subtitle: String) -> some View {
        HStack(spacing: 8) {
            Text(title)
                
                .fontWeight(.medium)
                .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2))
                .frame(maxWidth: .infinity, alignment: .topLeading)
            
            Spacer()
            
            Text(subtitle)
                .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2))
                .frame(maxWidth: .infinity, alignment: .topTrailing)
        }
        .font(Font.custom("Helvetica Neue LT GEO", size: 12))
    }
}

struct SuccessResultView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessResultView(buttonAction: {})
    }
}
