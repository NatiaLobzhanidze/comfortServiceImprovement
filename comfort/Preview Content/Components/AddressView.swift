//
//  AddressView.swift
//  comfort
//
//  Created by natia lobzhanidze on 30.11.23.
//

import SwiftUI

struct AddressView: View {
    @ScaledMetric var height = 60
    @ScaledMetric var iconSize = 20
    
    @State private var isSearchViewPresented = false
    @State private var selectedAddress = ""
    
    var placeholder = "შენი მისამართი"
    private var placeholderOffsetY: CGFloat {
        selectedAddress != "" ? -5 : 0
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image("location_ic")
                .foregroundColor(Color(hex: "#232E34", alpha: 1))
                .frame(width: iconSize, height: iconSize)
            
            VStack(alignment: .leading){
                Text(placeholder)
                    .offset(y: placeholderOffsetY)
                    .foregroundColor(Color(hex: "#232E34", alpha: 0.5))
                    .font(.system(size: selectedAddress != "" ? 12 : 14))
                
                if selectedAddress != "" {
                    Text(selectedAddress)
                        .foregroundColor(Color(hex: "#232E34", alpha: 1))
                }
            }
        }
        .padding(.leading, 12)
        .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .leading)
        .background(Color(red: 0.14, green: 0.18, blue: 0.2).opacity(0.05))
        .cornerRadius(8)
        .onTapGesture {
            isSearchViewPresented.toggle()
        }
        .sheet(isPresented: $isSearchViewPresented) {
            SearchView()        }
    }
}

struct RandomTitlesView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedItem: String
    let titles: [String] = [
        "SwiftUI Basics",
        "Data Binding in SwiftUI",
        "Lists and Navigation",
        "Animations in SwiftUI",
        "Custom Views and Modifiers",
        "State and Binding",
        "Core Data with SwiftUI",
        "Combine Framework",
        "MVVM Architecture",
        "Dark Mode Support",
        "Localization in SwiftUI"
    ]
    
    var body: some View {
        
        VStack (spacing: 5) {
            CustomTextField(placeholder: "your address",
                            keyboardType: .default,
                            showIcon: true)
            List(titles, id: \.self) { item in
                Text(item)
                    .onTapGesture {
                        selectedItem = item
                        print("Selected title: \(item)")
                        presentationMode.wrappedValue.dismiss()
                    }
            }
        }
    }
}

struct RandomTitlesView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView()
    }
}

