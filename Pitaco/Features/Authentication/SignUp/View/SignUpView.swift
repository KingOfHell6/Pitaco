//
//  SignUpView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 02/05/23.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject private var signUpVM = SignUpViewModel()
    @ObservedObject private var authService = FirebaseAuthService.shared
    @ObservedObject private var profilePhotoVM = ProfilePhotoViewModel()
    @Environment (\.presentationMode) var presentationMode
    
    var isShowingInsideSignInView: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ProfilePhotoView(profilePhotoVM: profilePhotoVM)

                UnsecureTextField(text: $signUpVM.userName, title: "Nome")

                UnsecureTextField(text: $signUpVM.email, title: "E-mail")

                SecureTextField(text: $signUpVM.password, isShowingPassword: $signUpVM.isShowingPassword, title: "Senha")

                SecureConfirmationTextField(
                    text: $signUpVM.confirmationPassword,
                    isShowingPassword: $signUpVM.isShowingPassword,
                    isPasswordsEquals: $signUpVM.isPasswordsEquals,
                    isPasswordEmpty: signUpVM.confirmationPassword.isEmpty
                )
                .onChange(of: signUpVM.confirmationPassword) { _ in
                    signUpVM.comparePasswords()
                }

                Text(authService.error?.localizedDescription ?? "")
                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 80, alignment: .center)
                    .padding(.horizontal, 47)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.red)
                    .font(.system(size: 15, weight: .bold))

                BlueButton(action: {
                    FirebaseAuthService.shared.signUp(
                        email: signUpVM.email,
                        password: signUpVM.password,
                        displayName: signUpVM.userName,
                        image: profilePhotoVM.userImage
                    )
                }, label: "Criar conta")

                if isShowingInsideSignInView {
                    OffBoxButton(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: "Já tem uma conta?")
                } else {
                    NavigationLink {
                        SignInView(isShowingInsideSignUpView: true)
                            .navigationTitle("Fazer login")
                    } label: {
                        Text("Já tem uma conta?")
                            .foregroundColor(.blue)
                            .font(.system(size: 17, weight: .bold))
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
