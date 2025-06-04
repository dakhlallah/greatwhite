//
//  eSIM Installation : Activation.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 11/05/2025.
//

import SwiftUI

struct eSIM_Installation___Activation: View {
    @State private var isActivating = false
    @State private var activationComplete = false

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "simcard.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)
                .padding(.top, 40)

            Text("Activate Your eSIM")
                .font(.title)
                .fontWeight(.bold)

            Text("Follow the steps below to install and activate your eSIM profile securely.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 16) {
                Label("Step 1: Check Compatibility", systemImage: "checkmark.circle")
                Label("Step 2: Scan the QR Code or Enter Details", systemImage: "qrcode.viewfinder")
                Label("Step 3: Confirm Profile Installation", systemImage: "arrow.down.circle")
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)

            Spacer()

            if activationComplete {
                Label("eSIM Activated Successfully", systemImage: "checkmark.seal.fill")
                    .foregroundColor(.green)
                    .font(.headline)
            } else if isActivating {
                ProgressView("Activating...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            } else {
                Button(action: startActivation) {
                    Text("Start Activation")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
        }
        .padding()
    }

    private func startActivation() {
        isActivating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isActivating = false
            activationComplete = true
        }
    }
}

#Preview {
    eSIM_Installation___Activation()
}
