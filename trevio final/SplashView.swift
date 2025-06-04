//
//  SplashView.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 07/05/2025.
//

import SwiftUI

struct SplashView: View {
    @State private var ghostOpacity: Double = 0.2
    @State private var navigateToWelcome = false
    
    func navigateToWelcomeScreen() {
        navigateToWelcome = true
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 16) {
                    Image("Asset 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .opacity(ghostOpacity)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                                ghostOpacity = 1.0
                            }
                        }

                    Text("Trevio")
                        .font(.custom("Satoshi-Bold", size: 36))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

                VStack(spacing: 20) {
                    Spacer()

                    Button(action: {
                        navigateToWelcomeScreen()
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $navigateToWelcome) {
                WelcomeScreen()
            }
        }
    }
}


#Preview {
    SplashView()
}

struct WelcomeScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var animateLogo = false
    @State private var animateText = false
    @State private var animateButton = false
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }
                    .padding()

                    Spacer()
                }

                Spacer()
            }

            VStack(spacing: 24) {
                Spacer()

                Image("welcome_illustration")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 240)
                    .opacity(animateLogo ? 1 : 0)
                    .offset(y: animateLogo ? 0 : 20)

                Group {
                    Text("Trevio")
                        .font(.custom("Satoshi-Bold", size: 28))
                    Text("Move with safety")
                        .font(.custom("Satoshi-Bold", size: 18))
                }
                .foregroundColor(.white)
                .opacity(animateText ? 1 : 0)
                .offset(y: animateText ? 0 : 20)

                Spacer()

                Button(action: {
                    // Handle Get Started tap
                }) {
                    HStack {
                        Text("Get started")
                            .font(.custom("Satoshi-Bold", size: 18))
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(12)
                }
                .opacity(animateButton ? 1 : 0)
                .offset(y: animateButton ? 0 : 20)
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .padding()
            .onAppear {
                withAnimation(.easeOut(duration: 1.0)) {
                    animateLogo = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeOut(duration: 1.0)) {
                        animateText = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    withAnimation(.easeOut(duration: 1.0)) {
                        animateButton = true
                    }
                }
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
