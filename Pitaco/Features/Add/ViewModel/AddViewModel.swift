//
//  AddViewModel.swift
//  Pitaco
//
//  Created by Matheus Araújo on 23/05/23.
//

import Foundation

class AddViewModel: ObservableObject {
    @Published var type: PitacoType
    @Published var title: String
    @Published var genre: PitacoGenre
    @Published var streaming: PitacoStreaming
    @Published var rating: Int
    @Published var pitaco: String
    @Published var isPublic: Bool

    init() {
        self.type = .other
        self.title = ""
        self.genre = .other
        self.streaming = .other
        self.rating = 0
        self.pitaco = ""
        self.isPublic = false
    }

    func savePitaco() {
        AddService.shared.createPitaco(Pitaco(
            type: self.type.rawValue,
            title: self.title,
            genre: self.genre.rawValue,
            streaming: self.streaming.rawValue,
            rating: self.rating,
            pitaco: self.pitaco,
            isPublic: self.isPublic)
        )
    }
}
