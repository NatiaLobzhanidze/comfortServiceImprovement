//
//  SearchViewCell.swift
//  comfort
//
//  Created by natia lobzhanidze on 05.12.23.
//

import SwiftUI

struct SearchViewCell: View {
    var body: some View {
        HStack(spacing: 16) {
            Image("location_ic")
                .frame(width: 20, height: 20)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Dimitri ARakishvili 2")
                    .font(Font.custom("Helvetica Neue LT GEO", size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2))
                
                Text("Tbilisi")
                    .font(Font.custom("Noto Sans Georgian", size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2).opacity(0.6))
            }
            
        }
        .padding(.horizontal)
        
    }
}

struct SearchViewCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewCell()
            .previewLayout(.sizeThatFits)
    }
}
