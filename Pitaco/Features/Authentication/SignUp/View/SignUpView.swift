//
//  SignUpView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 02/05/23.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var signUpVM = SignUpViewModel()
    @StateObject private var profilePhotoVM = ProfilePhotoViewModel()

    var body: some View {
        VStack {
            ProfilePhotoView(profilePhotoVM: profilePhotoVM)

            UnsecureTextField(text: $signUpVM.userName, title: "Nome")

            UnsecureTextField(text: $signUpVM.email, title: "E-mail")

            SecureTextField(text: $signUpVM.password, isShowingPassword: $signUpVM.isShowingPassword, title: "Senha")

            Button {
                FirebaseAuthService.shared.signUp(email: signUpVM.email, password: signUpVM.password, displayName: signUpVM.userName, image: profilePhotoVM.userImage) { result in
                    switch result {
                        case .success:
                            print("User signed up successfully")
                        case .failure(let error):
                            print("\(error.localizedDescription)")
                    }
                }
            } label: {
                Text("Cadastrar")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal, 20)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
