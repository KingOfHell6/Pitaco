//
//  PitacoModel.swift
//  Pitaco
//
//  Created by Matheus Araújo on 23/05/23.
//

import Foundation

struct Pitaco: Codable {
    let type: String
    let title: String
    let genre: String
    let streaming: String
    let rating: Int
    let pitaco: String
    let isPublic: Bool
}
