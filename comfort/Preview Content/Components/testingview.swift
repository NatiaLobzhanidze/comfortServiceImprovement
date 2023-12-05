import SwiftUI

struct ConttView: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        
        VStack {
            Spacer()
            
            CustomSheetView()
//                .transition(.move(edge: .leading))
                .animation(.easeInOut)
        }
        .background(Color.green)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CustomSheetView: View {
    @State private var sheetHeight: CGFloat = 300

    var body: some View {
        GeometryReader { geometry in
            VStack() {
                    BottomView(
                        minHeight: 100,
                        maxHeight: geometry.size.height,
                        height: $sheetHeight
                    )
                }
                .background(Color.white)
                .cornerRadius(20)
            }
    }
}

struct BottomView: View {
    let minHeight: CGFloat
    let maxHeight: CGFloat
    @Binding var height: CGFloat

    var body: some View {
        VStack {
          

            Text("Bottom Sheet Content")

            HStack {
                Button("Decrease Height") {
                   height = min(minHeight, height)
                }

                Button("Increase Height") {
                    height = max(maxHeight, height)
                }
          
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
            
            CustomButton(title: "წარმატებით გადაირიცხა", styleType: .blackBackground, isEnabled: true) {
                print("გგადაირიცხა")
            }
            
            CustomButton(title: "წარუმატებლად", styleType: .blackBackground, isEnabled: true) {
                print("გგადაირიცხა")
            }
            
        }
        .frame(height: height)
    }
}




struct ConttView_Previews: PreviewProvider {
    static var previews: some View {
        ConttView()
    }
}
