import SwiftUI

struct WelcomeView: View {
    @State private var isShowingMainView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Logo
                Image("imagef 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                
                Spacer()
                
                // Get Started Button
                Button(action: {
                    isShowingMainView = true
                }) {
                    Text("Get Started")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .fullScreenCover(isPresented: $isShowingMainView) {
                    Text("Main View Placeholder")
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
