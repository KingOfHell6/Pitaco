//
//  HomeView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 04/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            AsyncImage(url: FirebaseAuthService.shared.user?.photoURL)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
