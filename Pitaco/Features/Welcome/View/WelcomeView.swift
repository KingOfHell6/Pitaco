//
//  WelcomeView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 30/04/23.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject private var welcomeVM = WelcomeViewModel()

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            Text("📽️🍿")
                .font(.system(size: 60))
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("Bem vindo ao Pitaco")
                .font(.system(size: 37, weight: .bold))
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("O Pitaco é o aplicativo perfeito para todos os amantes de filmes e séries. Aqui, você pode explorar as últimas tendências, descobrir novos títulos e registrar seus pitacos")
                .font(.system(size: 15, weight: .bold))
                .multilineTextAlignment(.leading)

            Spacer()
                .frame(maxHeight: 17)

            BlueButton(action: {
                welcomeVM.isShowingSignUp.toggle()
            }, label: "Criar uma conta")

            GrayBlueButton(action: {
                welcomeVM.isShowingSignIn.toggle()
            }, label: "Fazer login")
        }
        .padding(.horizontal, 20)
        .sheet(isPresented: $welcomeVM.isShowingSignIn) {
            NavigationStack {
                SignInView()
                    .navigationTitle("Fazer login")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(15)
        }
        .sheet(isPresented: $welcomeVM.isShowingSignUp) {
            NavigationStack {
                SignUpView()
                    .navigationTitle("Criar conta")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(15)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
