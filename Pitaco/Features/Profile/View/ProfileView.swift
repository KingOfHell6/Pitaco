//
//  ProfileView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 06/05/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var firebaseAuthService = FirebaseAuthService.shared
    
    var body: some View {
        VStack {
            AsyncImage(
                url: firebaseAuthService.user?.photoURL,
                content: { image in
                    image.resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                        .background {
                            Circle().fill(
                                LinearGradient(
                                    colors: [.yellow, .orange],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        }
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            Text(firebaseAuthService.user?.displayName ?? "")
                .font(.system(size: 17, weight: .semibold))
                .fontWeight(.bold)
                .padding(.top, 10)
        }
        .onAppear {
            FirebaseAuthService.shared.realodUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
