//
//  WelcomeViewModel.swift
//  Pitaco
//
//  Created by Matheus Araújo on 30/04/23.
//

import Foundation

class WelcomeViewModel: ObservableObject {
    @Published var isShowingSignIn: Bool
    @Published var isShowingSignUp: Bool

    init() {
        self.isShowingSignIn = false
        self.isShowingSignUp = false
    }
}
