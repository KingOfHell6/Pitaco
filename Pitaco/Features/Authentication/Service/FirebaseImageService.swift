//
//  FirebaseImageService.swift
//  Pitaco
//
//  Created by Matheus Araújo on 14/05/23.
//

import FirebaseAuth
import FirebaseStorage
import Foundation
import SwiftUI

class FirebaseImageService {
    static let shared = FirebaseImageService()

    func uploadProfileImage(_ image: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure("Erro ao converter UIImage para Data" as! Error))
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

            imageRef.downloadURL { (url, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let url = url {
                    completion(.success(url))
                } else {
                    completion(.failure("Erro ao recuperar o URL da imagem no Firebase Storage" as! Error))
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
