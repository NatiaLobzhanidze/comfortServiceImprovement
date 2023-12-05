//
//  LocationView.swift
//  comfort
//
//  Created by natia lobzhanidze on 04.12.23.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @State private var showAlert = false
    @State var contentHeight: CGFloat = 350
    @State private var showSuccessResult = false
    @State private var showFailureResult = false
    @State private var showCancelOrderView = false
    
    @State private var region = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: 37.828856106105846, longitude: -122.47844712682773), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State private var currentView: ContentView = .mainDetails
    
    enum ContentView {
        case mainDetails
        case failureResult
        case successResult
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            Map(coordinateRegion:$region)
            
            Spacer()
            
            Container {
                contentView
                    .padding(.bottom, 44)
                    .frame(height: contentHeight)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showAlert) {
            Alert(
                title:
                    Text("დაადასტურე გამოძახება")
                    .font(.custom("Helvetica Neue LT GEO", size: 12)),
                message: Text("მანქანის ნომერი: BB-703-HB, Tbilisi, Dmitri Arakishvili 2, 11დეკ,2023, 11:50.\nმანქანის წვამ მოიმატა 5ჯერ")
                    .font(.custom("Helvetica Neue LT GEO", size: 12)),
                primaryButton:
                        .default(Text("დადასტურება")) {
                            withAnimation {
                                contentHeight += 190
                                currentView = .successResult
                            }
                        },
                secondaryButton: .destructive(Text("გაუქმება")) {
                    contentHeight = 300
                    showFailureResult = true
                    currentView = .failureResult
                }
            )
        }
        .sheet(isPresented: $showCancelOrderView) {
            CancelOrderView()
        }
    }
    
    var contentView: some View {
        
        switch currentView {
        case .mainDetails:
            return AnyView(MainDetailsSheet(clickPicker: {
                //Show Picker
            }, reservationAction: {
                showAlert = true
                print("Reservation Button Tapped")
            }))
        case .failureResult:
            return AnyView(FailureResultView())
        case .successResult:
            return AnyView(SuccessResultView(buttonAction: {
                showCancelOrderView = true
            }))
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

struct Container <Content : View> : View {
    var content : Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .background(Color.white)
            .cornerRadius(20)
    }
}
