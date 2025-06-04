import SwiftUI

struct FeatureHighlight4: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color(red: 221/255, green: 27/255, blue: 16/255)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Animated Illustration
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .offset(y: isAnimating ? -10 : 10)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isAnimating)
                
                VStack(spacing: 16) {
                    Text("You're ready to explore.")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Stay connected wherever you go. Trevio handles the signal. You focus on the journey.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.8))
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
    FeatureHighlight4()
}
