import SwiftUI
import UIKit

struct AccountSetupView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var firstNameError = false
    @State private var lastNameError = false
    @State private var errorMessage = ""
    @State private var isShaking = false
    
    // Feedback generators
    private let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    private let notificationGenerator = UINotificationFeedbackGenerator()
    
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
            
            // Title and Subtitle
            VStack(alignment: .leading, spacing: 8) {
                Text("What's your name?")
                    .font(.custom("Satoshi-Black", size: 24))
                
                Text("Let us know how to properly address you")
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(.secondary)
            }
            .padding(.top, 8)
            
            // First Name
            VStack(alignment: .leading, spacing: 8) {
                Text("First name")
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(.secondary)
                
                TextField("Enter first name", text: $firstName)
                    .font(.custom("Satoshi-Regular", size: 18))
                    .foregroundColor(.black)
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(firstNameError ? Color.red : Color(.systemGray3), lineWidth: 1)
                    )
                    .shakeEffect(isShaking: $isShaking)
                    #if compiler(>=5.9)
                    .onChange(of: firstName) { oldValue, newValue in
                        resetErrors()
                    }
                    #else
                    .onChange(of: firstName) { value in
                        resetErrors()
                    }
                    #endif
            }
            
            // Last Name
            VStack(alignment: .leading, spacing: 8) {
                Text("Last name")
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(.secondary)
                
                TextField("Enter last name", text: $lastName)
                    .font(.custom("Satoshi-Regular", size: 18))
                    .foregroundColor(.black)
                    .padding(16)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lastNameError ? Color.red : Color.clear, lineWidth: 1)
                    )
                    .shakeEffect(isShaking: $isShaking)
                    #if compiler(>=5.9)
                    .onChange(of: lastName) { oldValue, newValue in
                        resetErrors()
                    }
                    #else
                    .onChange(of: lastName) { value in
                        resetErrors()
                    }
                    #endif
            }
            
            // Error Message
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.custom("Satoshi-Regular", size: 14))
                    .foregroundColor(.red)
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
                    .background(!firstName.isEmpty && !lastName.isEmpty ? Color.black : Color.black.opacity(0.3))
                    .cornerRadius(20)
                }
                .disabled(firstName.isEmpty || lastName.isEmpty)
            }
            .padding(.bottom, 8)
        }
        .padding(.horizontal)
        .onAppear {
            notificationGenerator.prepare()
        }
    }
    
    private func validateAndProceed() {
        // Reset previous errors
        resetErrors()
        
        // Validate first name
        if firstName.count < 2 {
            showError(message: "First name must be at least 2 characters", isFirstName: true)
            return
        }
        
        // Validate last name
        if lastName.count < 2 {
            showError(message: "Last name must be at least 2 characters", isLastName: true)
            return
        }
        
        // Proceed to next screen
        // Add navigation logic here
    }
    
    private func showError(message: String, isFirstName: Bool = false, isLastName: Bool = false) {
        notificationGenerator.notificationOccurred(.error)
        withAnimation(.easeInOut(duration: 0.3)) {
            errorMessage = message
            firstNameError = isFirstName
            lastNameError = isLastName
            isShaking = true
        }
        
        // Reset shake after animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isShaking = false
        }
    }
    
    private func resetErrors() {
        withAnimation {
            errorMessage = ""
            firstNameError = false
            lastNameError = false
        }
    }
}

#Preview {
    AccountSetupView()
}
