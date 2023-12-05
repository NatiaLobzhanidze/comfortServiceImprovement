//
//  StartingScene.swift
//  comfort
//
//  Created by natia lobzhanidze on 29.11.23.
//

import SwiftUI

struct CustomView: View {
    @State private var isChecked = false
    @ScaledMetric var imageSize = 212
    @ScaledMetric var backgroundWidth = 350
    @ScaledMetric var backgroundHeight = 136
    @ScaledMetric var imagePadding = 80
    @ScaledMetric (relativeTo: .title2) var titleFontSize = 20
    @ScaledMetric var sixteen = 16
    @ScaledMetric var subTitleTopPadding = 8
    @ScaledMetric var eight = 8
    @ScaledMetric var SquareRadioBtnTop = 34
    @ScaledMetric var startButtonHPadding = 20
    @ScaledMetric var startButtonTopPadding = 94
    @ScaledMetric var startButtonBottomPadding = 40
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image("personalManagerImage")
                    .frame(width: imageSize, height: imageSize)
                
                VStack(alignment: .center, spacing: 8) {
                    Text("პერსონალური მენეჯერი")
                        .font(.system(size: titleFontSize))
                        .fontWeight(.bold)
                        .padding(.horizontal, sixteen)
                    .padding(.top, sixteen)
                    
                    Text("გამოძახება უფასოა")
                        .font(Font.custom("Helvetica Neue LT GEO", size: sixteen))
                        .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.08))
                }
                .padding(.top, 46)
                
                VStack(alignment: .leading, spacing: 12) {
                    BulletPoint(text: "აირჩიეთ თქვენთვის სასურველი დრო")
                    BulletPoint(text: "ასისტენტი მოვა და წაიყვანს მანქანას")
                    BulletPoint(text: "ავტომობილი დაზღვეულია")
                    BulletPoint(text: "ავტომობილი დაგიბრუნდებათ შეკეთებული")
                }
                .padding(sixteen)
                .background(Color(red: 0.08, green: 0.08, blue: 0.08).opacity(0.05))
                .cornerRadius(eight)
                .padding(.top, 24)
                
                
                SquareRadioButton(isChecked: $isChecked, title: "აღარ მაჩვენო")
                    .padding(.top, SquareRadioBtnTop)
                
                CustomButton(title: "გამოძახება",
                             styleType: .blackBackground,
                             isEnabled: true) {
                    print("Black Button Tapped")
                }
                             .padding(.horizontal, startButtonHPadding)
                             .padding(.top, startButtonTopPadding)
                             .padding(.bottom, startButtonBottomPadding)
                
            }
        }
    }
}

struct BulletPoint: View {
    var text: String
    @ScaledMetric var circleSize = 8
    @ScaledMetric var fontSize = 14
    @ScaledMetric var spacing  = 8
    
    var body: some View {
        HStack(spacing: spacing) {
            Image(systemName: "circle.fill")
                .resizable(resizingMode: .stretch)
                .foregroundColor(.orange)
                .frame(maxWidth: circleSize, maxHeight: circleSize)
            Text(text)
                .foregroundColor(Color("BulletsTextColor"))
                .font(.system(size: fontSize))
        }
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}

extension Color {
    init(hex: String, alpha: Double) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, opacity: alpha
        )
    }
}

