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
    @StateObject private var authService = FirebaseAuthService.shared
    var isShowingInsideSignUpView: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            UnsecureTextField(text: $signInVM.email, title: "E-mail")

            SecureTextField(text: $signInVM.password, isShowingPassword: $signInVM.isShowingPassword, title: "Senha")

            Text(authService.error?.localizedDescription ?? "")
                .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 80, alignment: .center)
                .padding(.horizontal, 47)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .font(.system(size: 15, weight: .bold))

            Spacer()

            GrayButton(action: {
                authService.signIn(with: signInVM.email, and: signInVM.password)
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
