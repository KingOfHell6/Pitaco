//
//  SignUpViewModel.swift
//  Pitaco
//
//  Created by Matheus Araújo on 04/05/23.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var email: String
    @Published var password: String
    @Published var confirmationPassword: String
    @Published var userName: String
    @Published var isShowingPassword: Bool
    @Published var isPasswordsEquals: Bool

    init() {
        self.email = ""
        self.password = ""
        self.confirmationPassword = ""
        self.userName = ""
        self.isShowingPassword = false
        self.isPasswordsEquals = false
    }

    func comparePasswords() {
        if password == confirmationPassword {
            self.isPasswordsEquals = true
        } else {
            self.isPasswordsEquals = false
        }
    }
}
