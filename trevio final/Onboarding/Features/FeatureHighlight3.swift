import SwiftUI

struct FeatureHighlight3: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color(red: 155/255, green: 41/255, blue: 21/255)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Animated Illustration
                Image(systemName: "doc.plaintext.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .offset(y: isAnimating ? -10 : 10)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isAnimating)
                
                VStack(spacing: 16) {
                    Text("No contracts. No stress.")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Pay only for what you need. No hidden fees. No commitments. Just data.")
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
    FeatureHighlight3()
}

