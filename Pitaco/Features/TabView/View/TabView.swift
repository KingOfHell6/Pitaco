//
//  TabView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 24/05/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                    .padding(.bottom, 20)
                    .navigationTitle("Pitaco")
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }

            NavigationView {
                ProfileView()
                    .navigationTitle("Perfil")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                FirebaseAuthService.shared.signOut()
                            } label: {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                            }

                        }
                    }
            }
            .tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
