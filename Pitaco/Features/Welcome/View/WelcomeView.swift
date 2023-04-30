//
//  WelcomeView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 30/04/23.
//

import SwiftUI

struct WelcomeView: View {
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

            Text("O Pitaco é o aplicativo perfeito para todos os amantes de filmes e séries. Aqui, você pode explorar as últimas tendências, descobrir novos títulos e guardar suas opiniões.")
                .font(.system(size: 15, weight: .bold))
                .multilineTextAlignment(.leading)

            Spacer()
                .frame(maxHeight: 17)

            BlueButton(action: {
                //
            }, text: "Criar uma conta")

            GrayBlueButton(action: {
                //
            }, text: "Fazer login")
        }
        .padding(.horizontal, 20)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
