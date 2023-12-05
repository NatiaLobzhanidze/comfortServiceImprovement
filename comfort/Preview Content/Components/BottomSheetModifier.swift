//
//  BottomSheetModifier.swift
//  comfort
//
//  Created by natia lobzhanidze on 01.12.23.
//

import SwiftUI

enum ContentViewType {
    case initial, failure
}

struct BottomSheetContent: View {
    @State private var isSheetPresented = false
    @State private var contentViewType: ContentViewType = .initial

    var body: some View {
        VStack {
            Spacer()

            Button("Open Bottom Sheet") {
                isSheetPresented.toggle()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)

            Spacer()
        }
        .sheet(isPresented: $isSheetPresented) {
            BottomSheetModifier(contentViewType: $contentViewType)
        }
    }
}

struct BottomSheetModifier: View {
    @Binding var contentViewType: ContentViewType
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            if contentViewType == .initial {
                ContentView()
            } else {
                FailureResultView()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .edgesIgnoringSafeArea(.bottom)
        .onTapGesture {
            // Change content view type on tap
            withAnimation {
                contentViewType = (contentViewType == .initial) ? .failure : .initial
            }
        }
        .onDisappear {
            // Reset content view type when the bottom sheet is dismissed
            contentViewType = .initial
        }
    }
}

struct BottomSheetContent_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetContent()
    }
}
