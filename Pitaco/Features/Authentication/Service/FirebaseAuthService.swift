//
//  FirebaseService.swift
//  Pitaco
//
//  Created by Matheus Araújo on 01/05/23.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService: ObservableObject {
    static let shared = FirebaseAuthService()
    
    @Published var error: Error?
    @Published var user: User?
    
    private init(error: Error? = nil, user: User? = nil) {
        Auth.auth().languageCode = "pt"
        self.error = error
        self.user = user
    }
    
    func signIn(with email: String, and password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            
            if let error {
                self?.error = error
            }
            
            if let authResult {
                self?.user = authResult.user
            }
        }
    }
}
