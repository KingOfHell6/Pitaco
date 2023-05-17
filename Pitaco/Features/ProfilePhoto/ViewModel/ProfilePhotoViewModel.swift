//
//  ProfilePhotoViewModel.swift
//  Pitaco
//
//  Created by Matheus Araújo on 17/05/23.
//

import Foundation
import SwiftUI
import PhotosUI

class ProfilePhotoViewModel: ObservableObject {
    @Published var profilePhotoItem: PhotosPickerItem?
    @Published var profilePhotoImage: Image?
    @Published var userImage: UIImage?

    func transformImage() {
        DispatchQueue.main.async {
            Task {
                if let data = try? await self.profilePhotoItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        self.profilePhotoImage = Image(uiImage: uiImage)
                        self.userImage = uiImage
                        return
                    }
                }
            }
        }
    }
}
