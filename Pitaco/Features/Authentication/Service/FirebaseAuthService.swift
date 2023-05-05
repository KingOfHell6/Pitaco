//
//  FirebaseService.swift
//  Pitaco
//
//  Created by Matheus Araújo on 01/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import SwiftUI

class FirebaseAuthService: ObservableObject {
    static let shared = FirebaseAuthService()

    @Published var error: Error?
    @Published var user: User?

    private init(error: Error? = nil, user: User? = nil) {
        self.error = error
        self.user = nil
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

    func signUp(email: String, password: String, displayName: String, image: UIImage?, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            // Set the display name
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = displayName
            changeRequest?.commitChanges { error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                // Upload the image and update photoURL
                if let image = image {
                    self.uploadProfileImage(image) { result in
                        switch result {
                            case .success(let photoURL):
                                self.updatePhotoURL(photoURL: photoURL) { result in
                                    completion(result)
                                }
                            case .failure(let error):
                                completion(.failure(error))
                        }
                    }
                } else {
                    completion(.success(()))
                }
            }
        }
    }

    func uploadProfileImage(_ image: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
    guard let imageData = image.jpegData(compressionQuality: 0.8) else {
        completion(.failure(NSError(domain: "ImageConversionError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert UIImage to Data"])))
        return
    }

    let storage = Storage.storage()
    let storageRef = storage.reference()
    let imageRef = storageRef.child("profile_images/\(UUID().uuidString).jpg")

        imageRef.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            // Get the download URL of the uploaded image
            imageRef.downloadURL { (url, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let url = url {
                    completion(.success(url))
                } else {
                    completion(.failure(NSError(domain: "FirebaseStorageError", code: -2, userInfo: [NSLocalizedDescriptionKey: "Failed to get the download URL"])))
                }
            }
        }
    }

    func updatePhotoURL(photoURL: URL, completion: @escaping (Result<Void, Error>) -> Void) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.photoURL = photoURL
        changeRequest?.commitChanges { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}


