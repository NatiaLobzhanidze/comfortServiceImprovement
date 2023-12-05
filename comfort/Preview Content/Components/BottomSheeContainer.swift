//
//  BottomSheeContainer.swift
//  comfort
//
//  Created by natia lobzhanidze on 30.11.23.
//

import SwiftUI

fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.3
}

struct BottomSheetView<Content: View>: View {
    
    @Binding var isOpen: Bool

    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content
    
    @GestureState private var translation: CGFloat = 0
    
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }

    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }
    
  
    private var indicator: some View {
          RoundedRectangle(cornerRadius: Constants.radius)
              .fill(Color.secondary)
              .frame(
                  width: Constants.indicatorWidth,
                  height: Constants.indicatorHeight
          ).onTapGesture {
           //  self.isOpen = true
          }
      }

    var body: some View {
          GeometryReader { geometry in
              VStack(spacing: 0) {
                  self.content
              }
              .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
              .background(Color(.secondarySystemBackground))
              .cornerRadius(Constants.radius)
              .frame(height: geometry.size.height, alignment: .bottom)
              .offset(y: max(self.offset + self.translation, 0))             
              .animation(.interactiveSpring())
          }
      }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isOpen: .constant(true), maxHeight: 700) {
            Rectangle().fill(Color.red)
        }.edgesIgnoringSafeArea(.all)
    }
}
