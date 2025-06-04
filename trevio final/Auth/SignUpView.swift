import SwiftUI
import UIKit

// MARK: - Shake Effect
struct ShakeEffect: GeometryEffect {
    @Binding var shaking: Bool
    
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    init(shaking: Binding<Bool>) {
        self._shaking = shaking
        self.animatableData = shaking.wrappedValue ? 1 : 0
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        guard shaking else { return ProjectionTransform(.identity) }
        let translation = amount * sin(animatableData * .pi * CGFloat(shakesPerUnit))
        return ProjectionTransform(CGAffineTransform(translationX: translation, y: 0))
    }
}

// MARK: - View Extension
extension View {
    func shakeEffect(isShaking: Binding<Bool>) -> some View {
        modifier(ShakeEffect(shaking: isShaking))
    }
}

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var isLoading = false
    @State private var loadingState: LoadingState = .none
    @State private var loadingProgress: CGFloat = 0
    @State private var isError = false
    @State private var errorMessage = ""
    @State private var isShaking = false
    
    // Feedback generators
    private let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let notificationGenerator = UINotificationFeedbackGenerator()
    
    enum LoadingState {
        case none
        case loading
        case connecting
        case complete
        case error
        
        var message: String {
            switch self {
            case .none: return ""
            case .loading: return "Loading..."
            case .connecting: return "Connecting..."
            case .complete: return "Connected!"
            case .error: return "Connection failed"
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Back button
            Button(action: { 
                impactGenerator.impactOccurred(intensity: 0.5)
                dismiss() 
            }) {
                Image(systemName: "arrow.left")
                    .font(.title3)
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .background(Color(.systemGray6))
                    .clipShape(Circle())
            }
            .padding(.top)
            
            // Title
            Text("What's your email address?")
                .font(.custom("Satoshi-Black", size: 24))
                .padding(.top, 8)
            
            VStack(alignment: .leading, spacing: 8) {
                // Email Input
                TextField("", text: $email)
                    .font(.custom("Satoshi-Regular", size: 18))
                    .foregroundColor(.black)
                    .padding(16)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isError ? Color.red : Color.clear, lineWidth: 1)
                    )
                    .overlay(
                        Text(email.isEmpty ? "hello@greatwhite.me" : "")
                            .font(.custom("Satoshi-Regular", size: 18))
                            .foregroundColor(.secondary)
                            .padding(.leading, 16),
                        alignment: .leading
                    )
                    .disabled(isLoading)
                    .shakeEffect(isShaking: $isShaking)
                    #if compiler(>=5.9)
                    .onChange(of: email) { oldValue, newValue in
                        if isError {
                            withAnimation {
                                isError = false
                                errorMessage = ""
                            }
                        }
                    }
                    #else
                    .onChange(of: email) { value in
                        if isError {
                            withAnimation {
                                isError = false
                                errorMessage = ""
                            }
                        }
                    }
                    #endif
                // Error Message
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .font(.custom("Satoshi-Regular", size: 14))
                        .foregroundColor(.red)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
            
            if loadingState != .none {
                // Loading View
                VStack(spacing: 16) {
                    // Progress Bar
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color(.systemGray5))
                                .frame(height: 4)
                            
                            Rectangle()
                                .fill(loadingState == .error ? Color.red : Color.black)
                                .frame(width: geometry.size.width * loadingProgress, height: 4)
                                .animation(.easeInOut(duration: 0.3), value: loadingProgress)
                        }
                    }
                    .frame(height: 4)
                    
                    // Loading Text
                    HStack(spacing: 12) {
                        if loadingState != .error && loadingState != .complete {
                            LoadingView()
                                .frame(width: 20, height: 20)
                        }
                        Text(loadingState.message)
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(loadingState == .error ? .red : .secondary)
                            .animation(.easeInOut, value: loadingState)
                    }
                }
                .transition(.move(edge: .top).combined(with: .opacity))
            }
            
            Spacer()
            
            // Next button
            HStack {
                Spacer()
                Button(action: {
                    impactGenerator.impactOccurred(intensity: 0.7)
                    validateAndProceed()
                }) {
                    HStack(spacing: 4) {
                        Text("Next")
                        Image(systemName: "arrow.right")
                    }
                    .font(.custom("Satoshi-Medium", size: 18))
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .frame(height: 40)
                    .background(Color.black)
                    .cornerRadius(20)
                }
                .disabled(email.isEmpty || isLoading)
            }
            .padding(.bottom, 8)
        }
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0.3), value: loadingState)
        .onAppear {
            notificationGenerator.prepare()
        }
    }
    
    private func validateAndProceed() {
        guard isValidEmail(email) else {
            showError("Please enter a valid email address")
            return
        }
        
        startLoadingSequence()
    }
    
    private func showError(_ message: String) {
        notificationGenerator.notificationOccurred(.error)
        withAnimation(.easeInOut(duration: 0.3)) {
            isError = true
            errorMessage = message
            isShaking = true
        }
        
        // Reset shake after animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isShaking = false
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func startLoadingSequence() {
        isLoading = true
        loadingState = .loading
        
        // Simulate loading progress with random success/failure
        withAnimation {
            loadingProgress = 0.4
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            loadingState = .connecting
            withAnimation {
                loadingProgress = 0.8
            }
            
            // Simulate random error
            let shouldFail = Bool.random()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if shouldFail {
                    notificationGenerator.notificationOccurred(.error)
                    withAnimation {
                        loadingState = .error
                        errorMessage = "Connection failed. Please try again."
                    }
                    
                    // Reset after error
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            loadingState = .none
                            loadingProgress = 0
                            isLoading = false
                        }
                    }
                } else {
                    notificationGenerator.notificationOccurred(.success)
                    loadingState = .complete
                    withAnimation {
                        loadingProgress = 1.0
                    }
                    
                    // Complete the sequence
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        // Navigate to next screen or handle completion
                    }
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}
