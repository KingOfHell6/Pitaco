//
//  ContentView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 30/04/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var firebase = FirebaseAuthService.shared
    var body: some View {
        NavigationStack {
            if firebase.user != nil {
                MainTabView()
            } else {
                WelcomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
