//
//  AddService.swift
//  Pitaco
//
//  Created by Matheus Araújo on 23/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddService: ObservableObject {
    static let shared = AddService()

    func getFirestoreReference() -> Firestore {
        return Firestore.firestore()
    }

    func getCurrentUserID() -> String? {
        return Auth.auth().currentUser?.uid
    }

    func createPitaco(_ pitaco: Pitaco) {
        guard let userID = getCurrentUserID() else {
            print("Usuário não autenticado.")
            return
        }

        let firestore = getFirestoreReference()

        var ref: DocumentReference? = nil

        ref = firestore.collection("users").document(userID).collection("pitacos").addDocument(data: [
            "type": pitaco.type,
            "title": pitaco.title,
            "genre": pitaco.genre,
            "streaming": pitaco.streaming,
            "rating": pitaco.rating,
            "pitaco": pitaco.pitaco,
            "isPublic": pitaco.isPublic
        ]) { error in
            if let error = error {
                print("Erro ao salvar o pitaco: \(error.localizedDescription)")
            } else {
                print("Pitaco salvo com sucesso, ID: \(ref!.documentID)")
            }
        }
    }

    func getPitacos(completion: @escaping ([Pitaco]?) -> Void) {
        guard let userID = getCurrentUserID() else {
            print("Usuário não autenticado.")
            completion(nil)
            return
        }

        let firestore = getFirestoreReference()

        // Adiciona um listener para receber atualizações em tempo real na subcoleção "pitacos" do usuário atual
        firestore.collection("users").document(userID).collection("pitacos").addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print("Erro ao recuperar os pitacos: \(error)")
                completion(nil)
                return
            }

            var pitacos: [Pitaco] = []

            for document in querySnapshot!.documents {
                // Decodifica o documento em uma instância de Pitaco
                guard let pitacoData = document.data() as? [String: Any],
                      let jsonData = try? JSONSerialization.data(withJSONObject: pitacoData),
                      let pitaco = try? JSONDecoder().decode(Pitaco.self, from: jsonData) else {
                    continue
                }
                pitacos.append(pitaco)
            }

            completion(pitacos)
        }
    }
}
