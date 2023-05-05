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
    @Published var userName: String
    @Published var isShowingPassword: Bool

    init() {
        self.email = ""
        self.password = ""
        self.userName = ""
        self.isShowingPassword = false
    }
}
