//
//  BottomTabBar.swift
//  trevio final
//
//  Created by DAKHLALLAH Oussama on 09/05/2025.
//

import SwiftUI

struct BottomTabBar: View {
    var body: some View {
        TabView {
            Text("eSIMs Screen")
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("eSIMs")
                }

            Text("Credits Screen")
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Credits")
                }

            Text("Help Screen")
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Help")
                }

            Text("Profile Screen")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    BottomTabBar()
}
