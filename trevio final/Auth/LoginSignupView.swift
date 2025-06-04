struct OnboardingAccountChoiceView: View {
    @State private var agreedToTerms = true

    var onboardingContent: some View {
        VStack(spacing: 24) {
            Spacer()

           VStack(alignment: .leading, spacing: 4) {
               Image("black tevio")
                   .resizable()
                   .frame(width: 52, height: 52)
               Text("Trevio")
                   .font(.custom("Satoshi-Black", size: 42))
                   .foregroundColor(.black)
           }
           .frame(maxWidth: .infinity, alignment: .leading)
           .padding(.bottom, 20)

            Text("Your passport to instant global data — no SIM cards, no borders, just Trevio.")
                .font(.custom("Satoshi-Regular", size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 4)
                .padding(.bottom, 12)

            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .top, spacing: 12) {
                    Button(action: {
                        agreedToTerms.toggle()
                    }) {
                        Image(systemName: agreedToTerms ? "checkmark.square.fill" : "square")
                            .foregroundColor(agreedToTerms ? .black : .gray)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("I agree with")
                            .font(.custom("Satoshi-Regular", size: 14))

                        Text("User Terms And Conditions and acknowledge the Privacy Notice of Trevio.")
                            .font(.custom("Satoshi-Regular", size: 14))
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 16)

            VStack(spacing: 12) {
                NavigationLink(destination: NewAccountEmailView()) {
                    HStack {
                        Text("New account")
                            .font(.custom("Satoshi-Black", size: 16))
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(agreedToTerms ? Color.black : Color(.systemGray6))
                    .foregroundColor(agreedToTerms ? .white : .gray)
                    .cornerRadius(16)
                }
                .disabled(!agreedToTerms)

                NavigationLink(destination: ExistingAccountView()) {
                    HStack {
                        Text("Existing account")
                            .font(.custom("Satoshi-Black", size: 16))
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(agreedToTerms ? Color(.systemGray6) : Color(.systemGray6))
                    .foregroundColor(agreedToTerms ? .black : .gray)
                    .cornerRadius(16)
                }
                .disabled(!agreedToTerms)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomLeading) {
                onboardingContent

                Button(action: {
                    // Back action placeholder
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                        .padding()
                }
            }
        }
    }
}

#Preview {
    OnboardingAccountChoiceView()
}
import SwiftUI
struct NewAccountEmailView: View {
    @State private var email: String = ""

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 24) {
                Spacer().frame(height: 20)

                Text("What's your email address?")
                    .font(.custom("Satoshi-Black", size: 24))
                    .foregroundColor(.black)

                TextField("name@example.com", text: $email)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                if !isValidEmail(email) && !email.isEmpty {
                    Text("The email you entered is invalid.")
                        .foregroundColor(.red)
                        .font(.footnote)
                }

                Spacer().frame(maxHeight: .infinity)
            }
            .padding()

            HStack {
                Button(action: {
                    // Back action
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                }

                Spacer()

                Button(action: {
                    // Next action
                }) {
                    HStack {
                        Text("Next")
                        Image(systemName: "arrow.right")
                    }
                    .padding()
                    .foregroundColor(email.isEmpty ? .gray : .white)
                    .background(email.isEmpty ? Color(.systemGray5) : Color.black)
                    .clipShape(Capsule())
                }
                .disabled(email.isEmpty)
            }
            .padding()
        }
    }
}

struct NewAccountEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountEmailView()
    }
}

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                .scaleEffect(2)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .ignoresSafeArea()
    }
}

#Preview {
    LoadingView()
}


struct NewAccountNameView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 24) {
                Spacer().frame(height: 20)

                Text("What's your name?")
                    .font(.custom("Satoshi-Black", size: 24))
                    .foregroundColor(.black)

                Text("Let us know how to properly address you")
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(.gray)

                VStack(spacing: 16) {
                    VStack(alignment: .leading) {
                        Text("First name")
                            .font(.custom("Satoshi-Regular", size: 14))
                            .foregroundColor(.black)
                        TextField("Enter first name", text: $firstName)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    }

                    VStack(alignment: .leading) {
                        Text("Last name")
                            .font(.custom("Satoshi-Regular", size: 14))
                            .foregroundColor(.black)
                        TextField("Enter last name", text: $lastName)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }

                Spacer()
            }
            .padding()

            HStack {
                Button(action: {
                    // Back action
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                }

                Spacer()

                Button(action: {
                    // Next action
                }) {
                    HStack {
                        Text("Next")
                        Image(systemName: "arrow.right")
                    }
                    .padding()
                    .foregroundColor((firstName.isEmpty || lastName.isEmpty) ? .gray : .white)
                    .background((firstName.isEmpty || lastName.isEmpty) ? Color(.systemGray5) : Color.black)
                    .clipShape(Capsule())
                }
                .disabled(firstName.isEmpty || lastName.isEmpty)
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NewAccountNameView()
}


// Placeholder for ExistingAccountView to resolve "Cannot find in scope" error
struct ExistingAccountView: View {
    var body: some View {
        Text("Existing Account")
            .font(.title)
            .padding()
    }
}

#Preview {
    ExistingAccountView()
}
