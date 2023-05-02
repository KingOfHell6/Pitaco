//
//  SignInView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 01/05/23.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
    @StateObject private var signInVM = SignInViewModel()
    @StateObject private var firebaseService = FirebaseService()

    var body: some View {
        VStack {
            Spacer()
                .frame(maxHeight: 71)

            Text("E-mail")
                .frame(maxWidth: .infinity, maxHeight: 22, alignment: .leading)
                .offset(x: +18)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(Color("TextFieldLabel"))

            HStack {
                TextField("", text: $signInVM.email)
                    .foregroundColor(.white)
                    .padding(.horizontal, 18)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color("TextField"))
            .cornerRadius(15)

            Text("Senha")
                .frame(maxWidth: .infinity, maxHeight: 22, alignment: .leading)
                .offset(x: +18)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(Color("TextFieldLabel"))

            HStack {
                TextField("", text: $signInVM.password)
                    .foregroundColor(.white)
                    .padding(.horizontal, 18)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color("TextField"))
            .cornerRadius(15)

            if !(firebaseService.error?.localizedDescription.isEmpty ?? false) {
                Text(firebaseService.error?.localizedDescription ?? "")
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .padding(.horizontal, 47)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.red)
                    .font(.system(size: 15, weight: .bold))
            }

            GrayButton(action: {
                firebaseService.signIn(with: signInVM.email, and: signInVM.password)
            }, label: "Fazer login com e-mail")

            OffBoxButton(action: {
                //
            }, label: "Ainda não tem uma conta?")
        }
        .padding(.horizontal, 20)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
