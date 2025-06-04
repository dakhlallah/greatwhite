import SwiftUI
import Combine

struct OTPVerificationView: View {
    let phoneNumber: String
    @State private var otpCode = ""
    @State private var timeRemaining = 9 // Initial time in seconds
    @State private var timer: Timer?
    @State private var isResendEnabled = false
    @State private var isError = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Back button
            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .font(.title3)
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .background(Color(.systemGray6))
                    .clipShape(Circle())
            }
            .padding(.top)
            
            // Title and subtitle
            VStack(alignment: .leading, spacing: 8) {
                Text("Enter the 4-digit code sent to\nyou at \(phoneNumber).")
                    .font(.custom("Satoshi-Black", size: 24))
                    .lineSpacing(4)
                
                Button(action: { dismiss() }) {
                    Text("Changed your mobile number?")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .underline()
                        .foregroundColor(.black)
                }
            }
            
            // OTP Input Fields
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    ForEach(0..<4) { index in
                        OTPTextField(text: getDigit(at: index), isError: isError)
                            .onTapGesture {
                                // Show keyboard
                            }
                    }
                }
                .frame(height: 56)
                
                if isError {
                    Text("The SMS passcode you've entered is incorrect.")
                        .font(.custom("Satoshi-Regular", size: 14))
                        .foregroundColor(Color.red)
                }
            }
            
            // Resend options
            VStack(spacing: 16) {
                Button(action: {
                    if isResendEnabled {
                        resendCode()
                    }
                }) {
                    Text(timeRemaining > 0 ? "Resend code via SMS (\(String(format: "%d:%02d", timeRemaining/60, timeRemaining%60)))" : "Resend code via SMS")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(isResendEnabled ? .black : .secondary)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                
                Button(action: {
                    // Handle call me action
                }) {
                    Text("Call me with code")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(.black)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
            }
            
            Spacer()
            
            // Next button
            HStack {
                Spacer()
                Button(action: {
                    validateCode()
                }) {
                    HStack(spacing: 4) {
                        Text("Next")
                        Image(systemName: "arrow.right")
                    }
                    .font(.custom("Satoshi-Medium", size: 18))
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .frame(height: 40)
                    .background(otpCode.count == 4 ? Color.black : Color.black.opacity(0.3))
                    .cornerRadius(20)
                }
                .disabled(otpCode.count != 4)
            }
            .padding(.bottom, 8)
        }
        .padding(.horizontal)
        .onAppear(perform: startTimer)
        .onDisappear(perform: stopTimer)
    }
    
    private func validateCode() {
        // Simulate validation
        withAnimation(.easeInOut(duration: 0.3)) {
            isError = true
        }
    }
    
    private func getDigit(at index: Int) -> Binding<String> {
        return Binding(
            get: {
                if index < otpCode.count {
                    return String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: index)])
                }
                return ""
            },
            set: { newValue in
                var code = otpCode
                if !newValue.isEmpty {
                    if index == code.count {
                        code.append(newValue.last!)
                    }
                } else if !code.isEmpty && index == code.count - 1 {
                    code.removeLast()
                }
                otpCode = code
                if isError {
                    withAnimation {
                        isError = false
                    }
                }
            }
        )
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                isResendEnabled = true
                timer?.invalidate()
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func resendCode() {
        timeRemaining = 9
        isResendEnabled = false
        startTimer()
        // Add resend code logic here
    }
}

struct OTPTextField: View {
    @Binding var text: String
    var isError: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(isError ? Color.red : (text.isEmpty ? Color(.systemGray4) : Color.black), lineWidth: 1)
                .frame(width: 56, height: 56)
            
            if text.isEmpty {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.systemGray6))
                    .frame(width: 48, height: 48)
            } else {
                Text(text)
                    .font(.custom("Satoshi-Black", size: 24))
                    .foregroundColor(isError ? .red : .black)
            }
        }
    }
}

#Preview {
    OTPVerificationView(phoneNumber: "(243) 99000-0027")
}
