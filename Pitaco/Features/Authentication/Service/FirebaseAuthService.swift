//
//  FirebaseService.swift
//  Pitaco
//
//  Created by Matheus Araújo on 01/05/23.
//

import FirebaseAuth
import Foundation
import SwiftUI

class FirebaseAuthService: ObservableObject {
    static let shared = FirebaseAuthService()

    @Published var error: Error?
    @Published var user: User?
    
    private init(error: Error? = nil, user: User? = nil) {
        self.error = error
        self.user = nil
    }
    
    func addStateDidChangeListener() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard self != nil else { return }
            
            if let user = user {
                self?.user = user
            }
        }
    }
    
    func signIn(with email: String, and password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            
            if let error = error {
                self?.error = error
            }
            
            if let authResult = authResult {
                self?.user = authResult.user
            }
        }
    }
    
    func signUp(email: String, password: String, displayName: String, image: UIImage?) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.error = error
                return
            }

            if let user = authResult?.user {
                self.user = user
            }

            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()

            changeRequest?.displayName = displayName
            changeRequest?.commitChanges { error in
                if let error = error {
                    self.error = error
                    return
                }

                guard let image = image else { return }

                FirebaseImageService.shared.uploadProfileImage(image) { result in
                    switch result {
                        case .success(let photoURL):
                            FirebaseImageService.shared.updatePhotoURL(photoURL: photoURL) { _ in}
                        case .failure(let error):
                            self.error = error
                    }
                }
            }

            self.realodUser()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            self.error = error
        }
    }

    func realodUser() {
        Auth.auth().currentUser?.reload()
    }
}
