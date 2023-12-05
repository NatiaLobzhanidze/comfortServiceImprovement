//
//  FailureResultView.swift
//  comfort
//
//  Created by natia lobzhanidze on 01.12.23.
//

import SwiftUI

struct FailureResultView: View {
    @ScaledMetric var viewHPadding = 20
    @ScaledMetric var viewYPadding = 16
    
    var body: some View {
        VStack(spacing: viewYPadding) {
            AddressView()
                .padding(.top, 20)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("SeparatorLineColor"))
            
            ResultView(state: .failure)
        }
        .padding(.horizontal, viewHPadding)
    }
}

struct FailureResultView_Previews: PreviewProvider {
    static var previews: some View {
        FailureResultView()
    }
}
