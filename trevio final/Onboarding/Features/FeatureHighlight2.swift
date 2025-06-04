import SwiftUI

struct FeatureHighlight2: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color("#E9B44C")
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Animated Illustration
               Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .foregroundColor(.black)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(Animation.linear(duration: 20).repeatForever(autoreverses: false), value: isAnimating)
                
                VStack(spacing: 16) {
                    Text("One eSIM. One whole planet.")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Text("Get online in 200+ countries with just one app. Choose your plan and activate in one tap.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.8))
                        .padding(.horizontal)
                }
            }
            .padding()
        }
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    FeatureHighlight2()
}
