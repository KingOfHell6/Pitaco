//
//  SignInView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 01/05/23.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
    @ObservedObject private var signInVM = SignInViewModel()
    @ObservedObject private var authService = FirebaseAuthService.shared
    @Environment (\.presentationMode) var presentationMode
    
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

            if isShowingInsideSignUpView {
                OffBoxButton(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: "Ainda não tem uma conta?")
            } else {
                NavigationLink {
                    SignUpView(isShowingInsideSignInView: true)
                        .navigationTitle("Criar conta")
                } label: {
                    Text("Ainda não tem uma conta?")
                        .foregroundColor(.blue)
                        .font(.system(size: 17, weight: .bold))
                }

            }
        }
        .padding(.horizontal, 20)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
