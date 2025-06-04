import SwiftUI
import ConcentricOnboarding

struct OnboardingContainerView: View {
    @State private var shouldShowMainView = false
    
    // Define custom colors
    let darkBrown = Color(red: 28/255, green: 17/255, blue: 10/255)
    let gold = Color(red: 233/255, green: 180/255, blue: 76/255)
    let rust = Color(red: 155/255, green: 41/255, blue: 21/255)
    let white = Color.white
    
    var body: some View {
        ZStack {
            if shouldShowMainView {
                Text("Main View Placeholder")
                    .transition(.opacity)
            } else {
                ConcentricOnboardingView(pageContents: [
                    (AnyView(FeatureHighlight1()), darkBrown),
                    (AnyView(FeatureHighlight2()), gold),
                    (AnyView(FeatureHighlight3()), rust),
                    (AnyView(FeatureHighlight4()), rust)
                ])
                .duration(1.0)
                .nextIcon("chevron.forward")
                .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 1.0), value: shouldShowMainView)
    }
}

#Preview {
    OnboardingContainerView()
}
