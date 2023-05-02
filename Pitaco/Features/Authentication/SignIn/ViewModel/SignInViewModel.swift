//
//  SignInViewModel.swift
//  Pitaco
//
//  Created by Matheus Araújo on 01/05/23.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var email: String
    @Published var password: String
    @Published var error: String
    @Published var isShowingPassword: Bool

    init() {
        self.email = ""
        self.password = ""
        self.error = ""
        self.isShowingPassword = false
    }
}
