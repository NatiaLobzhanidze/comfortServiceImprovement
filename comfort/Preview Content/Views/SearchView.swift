//
//  SearchView.swift
//  comfort
//
//  Created by natia lobzhanidze on 05.12.23.
//

import SwiftUI

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = true
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack (spacing: 16){
                HStack(spacing: 20) {
                    CustomTextField(text: searchText, placeholder: "შენი მისამართი", keyboardType: .default,
                        showIcon: true,
                        backgroundColor: .white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.16, green: 0.34, blue: 0.72), lineWidth: 1)
                        )
                        .padding(.top, 20)
                    
                    Image("dismiss_button_ic")
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("SeparatorLineColor"))

                // Search Results List
                List {
                    ForEach(0..<10) { index in
                        Text("Result \(index)")
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .padding(.horizontal, 20)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

