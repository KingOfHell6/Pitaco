//
//  SignUpViewModel.swift
//  Pitaco
//
//  Created by Matheus Araújo on 02/05/23.
//

import SwiftUI
import PhotosUI

class ProfilePhotoViewModel: ObservableObject {
    @Published private(set) var imageState: ImageState = .empty
    @Published var userImage: UIImage?
    @Published var selectedImage: PhotosPickerItem? = nil {
        didSet {
            if let selectedImage = selectedImage {
                let progress = loadTransferable(from: selectedImage)
                imageState = .loading(progress)
            } else {
                imageState = .empty
            }
        }
    }

    enum ImageState {
        case empty
        case loading(Progress)
        case success(Image)
        case failure(Error)
    }

    struct ProfileImage: Transferable {
        let uiImage: UIImage
        let image: Image

        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
                guard let uiImage = UIImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(uiImage: uiImage)
                return ProfileImage(uiImage: uiImage, image: image)
            }
        }
    }

    private func loadTransferable(from selectedImage: PhotosPickerItem) -> Progress {
        return selectedImage.loadTransferable(type: ProfileImage.self) { result in
            DispatchQueue.main.async {
                guard selectedImage == self.selectedImage else {
                    print("Falha ao carregar a imagem selecionada")
                    return
                }

                switch result {
                    case .success(let profileImage?):
                        self.imageState = .success(profileImage.image)
                        self.userImage = profileImage.uiImage
                    case .success(nil):
                        self.imageState = .empty
                    case .failure(let error):
                        self.imageState = .failure(error)
                }
            }
        }
    }
}
