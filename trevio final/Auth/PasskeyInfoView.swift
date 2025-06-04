import SwiftUI

struct CreatePasskeyView: View {
    @State private var showSheet = false
    @State private var showToast = false
    @State private var toastMessage = ""
    @State private var toastType: ToastType = .success

    var body: some View {
        VStack(spacing: 24) {
            Spacer().frame(height: 40)

            // MARK: - Icon
            HStack {
               Image("key-icon")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(Color.blue))
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            
            // MARK: - Title
            Text("Create a passkey")
                .font(.custom("Satoshi-Black", size: 42))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)

            // MARK: - Description
            Text("Passkeys are easier and more secure than passwords.")
                .font(.custom("Satoshi-Black", size: 17))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 32)
                .frame(maxWidth: .infinity, alignment: .leading)

            // MARK: - Subheader
            Text("With passkeys, you can log in to Trevio with:")
                .font(.custom("Satoshi-Black", size: 16))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)

            // MARK: - Methods
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 14) {
                    Image(systemName: "faceid")
                        .foregroundColor(.black)
                    Text("Face ID")
                        .font(.custom("Satoshi-Black", size: 17))
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 14) {
                    Image(systemName: "touchid")
                        .foregroundColor(.black)
                    Text("Touch ID")
                        .font(.custom("Satoshi-Black", size: 17))
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 14) {
                    Image(systemName: "circle.grid.3x3.fill")
                        .foregroundColor(.black)
                    Text("Passcode")
                        .font(.custom("Satoshi-Black", size: 17))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 32)
            .padding(.top, 8)

            // MARK: - Learn More
            Button(action: {
                // Handle Learn More
            }) {
                Text("Learn more")
                    .font(.custom("Satoshi-Black", size: 15))
                    .underline()
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
            }
            .padding(.top, 16)

            Spacer()

            // MARK: - Create Passkey Button
            Button(action: {
                print("Passkey creation started")
                showSheet = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    toastMessage = "Passkey created successfully!"
                    toastType = .success
                    withAnimation {
                        showToast = true
                    }
                }
            }) {
                Text("Create passkey")
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 24)
            .sheet(isPresented: $showSheet) {
                VStack(spacing: 24) {
                    Spacer().frame(height: 16)

                    // Face ID Icon
                    Image(systemName: "faceid")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)

                    // Title
                    Text("Use Face ID to sign in?")
                        .font(.custom("Satoshi-Black", size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding(.horizontal)

                    // Description
                    Text("A passkey for your phone number will be saved in iCloud Keychain and available on all your devices.")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 24)

                    // Continue Button
                    Button(action: {
                        // Handle continue
                        showSheet = false
                        toastMessage = "Face ID setup completed!"
                        toastType = .success
                        withAnimation {
                            showToast = true
                        }
                    }) {
                        Text("Continue")
                            .font(.custom("Satoshi-Black", size: 17))
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 24)

                    // Secondary Action
                    Button(action: {
                        // Handle alternative device
                        showSheet = false
                        toastMessage = "Alternative device option selected"
                        toastType = .info
                        withAnimation {
                            showToast = true
                        }
                    }) {
                        Text("Save on Another Device")
                            .font(.custom("Satoshi-Regular", size: 15))
                            .foregroundColor(.blue)
                    }

                    Spacer().frame(height: 20)
                }
                .padding()
                .background(Color.white)
                .presentationDetents([.fraction(0.45)])
                .presentationDragIndicator(.visible)
            }

            // MARK: - Not Now Button
            Button(action: {
                // Handle Not Now
                toastMessage = "Passkey creation skipped"
                toastType = .warning
                withAnimation {
                    showToast = true
                }
            }) {
                Text("Not now")
                    .font(.custom("Satoshi-Black", size: 17))
                    .foregroundColor(.black)
            }
            .padding(.top, 12)

            Spacer().frame(height: 20)
        }
        .ignoresSafeArea(edges: .bottom)
        .background(Color.white)
        .toast(isPresented: $showToast, message: toastMessage, type: toastType)
    }
}

// MARK: - Preview
struct CreatePasskeyView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasskeyView()
    }
}
