//
//  ResultView.swift
//  comfort
//
//  Created by natia lobzhanidze on 30.11.23.
//

import SwiftUI

enum ResultState {
    case success
    case failure
}

struct ResultView: View {
    var state: ResultState
    @ScaledMetric var circleSize = 70
    @ScaledMetric var failureIcSize = 33
    @ScaledMetric var successIcWidth = 25
    @ScaledMetric var successIcHeight = 10
    @ScaledMetric var verticalSpacing = 8
    @ScaledMetric var titleFontSize = 16
    @ScaledMetric var subtitleFontSize = 14
    
    private var iconWidth: Double {
        state == .success ? successIcWidth : failureIcSize
    }
    
    private var iconHeight: Double {
        state == .success ? successIcHeight : failureIcSize
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: verticalSpacing) {
          if state == .success {
              LottieView()
                  .frame(width: 64, height: 64)
            } else {
                Image("failure_result_ic")
            }
            
            
            Text(getTitle())
                .font(.system(size: titleFontSize,
                              weight: .regular))
                .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2))
            
            Text(getSubtitle())
                .font(Font.custom("Helvetica Neue LT GEO", size: subtitleFontSize))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2).opacity(0.6))
        }
    }
    
    private func getResultImage() -> Image {
        switch state {
        case .success:
            return Image("succes_result_ic")
        case .failure:
            return Image("failure_result_ic")
        }
    }
    
    private func getBackgroundColor() -> Color {
        switch state {
        case .success:
            return Color("success_result_backC")
        case .failure:
            return Color("failure_result_backC")
        }
    }
    
    private func getTitle() -> String {
        switch state {
        case .success:
            return "თქვენი განაცხადი მიღებულია"
        case .failure:
            return "სერვისი მიუწვდომელია"
        }
    }
    
    private func getSubtitle() -> String {
        switch state {
        case .success:
            return "მიმდინარეობს თქვენი პირადი აგენტის მოძიება, სავარაუდო დრო 30წუთი. შეტყობინებას მიიღებთ ესემესის და აპლიკაციის სახით"
        case .failure:
            return "მითითებულ ლოკაციაზე თეგეტა სერვისი არ ფუნქციონირებს, გთხოვთ შეცვალოთ ლოკაცია თბილისის რეგიონზე"
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(state: .success)
    }
}
