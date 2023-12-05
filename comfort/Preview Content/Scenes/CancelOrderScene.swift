//
//  CancelOrderScene.swift
//  comfort
//
//  Created by natia lobzhanidze on 05.12.23.
//
import SwiftUI

struct CancelOrderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedReason: String?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("გთხოვთ აირჩიოთ\nგაუქმების მიზეზი")
                            .font(.custom("Helvetica Neue LT GEO", size: 24))
                            .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2))
                        
                        Text("ვწუხვართ რომ გამოძახებას აუქმებთ, გთხოვთ\nაირჩიოთ მიზეზი რათა მომავალში უკეთესი\nგამოცდილება შემოგთავაზოთ")
                            .font(.custom("Helvetica Neue LT GEO", size: 14))
                            .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2).opacity(0.6))
                    }
                    .padding(.top, 48)
                    
                    VStack(alignment: .leading, spacing: 23) {
                        RadioButtonView(text: "ინფორმაცია მივუთითე არასწორად", isSelected: selectedReason == "Incorrect Information") {
                            selectedReason = "Incorrect Information"
                        }
                        
                        RadioButtonView(text: "ხანგრძლივი ლოდინის დრო", isSelected: selectedReason == "Extended Loading Time") {
                            selectedReason = "Extended Loading Time"
                        }
                        
                        RadioButtonView(text: "გადავიფიქრე სერვისით სარგებლობა", isSelected: selectedReason == "Changed Mind About Service") {
                            selectedReason = "Changed Mind About Service"
                        }
                        
                        RadioButtonView(text: "სხვა", isSelected: selectedReason == "Other") {
                            selectedReason = "Other"
                        }
                        
                        CommentTextField(placeholder: "გთხოვთ დაგვიწეროთ მიზეზი", keyboardType: .default)
                    }
                    .padding(.top, 48)
                    
                    Spacer()
                    
                    CustomButton(title: "გაუქმება", styleType: .blackBackground, isEnabled: true, action: {})
                }
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .navigationBarTitle("გამოძახების გაუქმება", displayMode: .inline)
                .navigationBarItems(
                    trailing: Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("dismiss_button_ic")
                            .padding(.horizontal, 2)
                    }
                )
            }
        }
    }
}

struct CancelOrderView_Previews: PreviewProvider {
    static var previews: some View {
        CancelOrderView()
    }
}

struct RadioButtonView: View {
    var text: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2))
                
                Text(text)
                    .font(.custom("Helvetica Neue LT GEO", size: 14))
                    .foregroundColor(Color(red: 0.14, green: 0.18, blue: 0.2))
            }
        }
    }
}

