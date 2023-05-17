//
//  TesteView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 16/05/23.
//

import SwiftUI
import PhotosUI

struct ProfilePhotoView: View {
    @ObservedObject var profilePhotoVM: ProfilePhotoViewModel

    var body: some View {
        VStack {
            if let profileImage = profilePhotoVM.profilePhotoImage {
                circularImage(image: profileImage.resizable())
            } else {
                circularImage(image: Image(systemName: "person.fill"))
            }
        }
        .overlay(alignment: .bottomTrailing) {
            PhotosPicker(selection: $profilePhotoVM.profilePhotoItem, matching: .images) {
                Image(systemName: "pencil.circle.fill")
                    .symbolRenderingMode(.multicolor)
                    .font(.system(size: 30))
                    .foregroundColor(.accentColor)
            }
            .buttonStyle(.borderless)
        }
        .onChange(of: profilePhotoVM.profilePhotoItem) { _ in
            profilePhotoVM.transformImage()
        }
    }

    @ViewBuilder
    func circularImage(image: Image?) -> some View {
        image?
            .font(.system(size: 40))
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            .background {
                Circle().fill(
                    LinearGradient(
                        colors: [.white, .gray],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            }
    }
}

struct TesteView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoView(profilePhotoVM: ProfilePhotoViewModel())
    }
}
