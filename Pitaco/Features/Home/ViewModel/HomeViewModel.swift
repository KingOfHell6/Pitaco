//
//  HomeViewModel.swift
//  Pitaco
//
//  Created by Matheus Araújo on 23/05/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var pitacos: [Pitaco] = []
    @Published var isShowingAdd: Bool = false

    func getPitacos() {
        AddService.shared.getPitacos { retrievedPitacos in
            if let retrievedPitacos = retrievedPitacos {
                self.pitacos = retrievedPitacos
            }
        }
    }
}
