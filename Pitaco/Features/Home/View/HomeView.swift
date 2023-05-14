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
            TabView {
                Text("Home")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }

                Text("Search")
                    .tabItem {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                        Text("Em alta")
                    }

                NavigationView {
                    ProfileView()
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
