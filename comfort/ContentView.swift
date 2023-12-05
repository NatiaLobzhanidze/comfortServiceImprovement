import SwiftUI

struct ContentView: View {
    @State private var isEnabled = true

    var body: some View {
        VStack(spacing: 20) {
            CustomButton(title: "გამოძახება",
                         styleType: .blackBackground,
                         isEnabled: isEnabled) {
                print("Black Button Tapped")
            }

            CustomButton(title: "გაუქმება",
                         styleType: .whiteBackground,
                         isEnabled: isEnabled) {
                print("White Button Tapped")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
