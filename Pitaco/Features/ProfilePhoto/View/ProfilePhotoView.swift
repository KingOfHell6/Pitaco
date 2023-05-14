//
//  SignUpView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 02/05/23.
//

import SwiftUI
import PhotosUI

struct ProfilePhotoView: View {
    @StateObject var profilePhotoVM: ProfilePhotoViewModel

    var body: some View {
        EditableCircularProfileImage(profilePhotoVM: profilePhotoVM)
    }
}

struct EditableCircularProfileImage: View {
    @StateObject var profilePhotoVM: ProfilePhotoViewModel

    var body: some View {
        CircularProfileImage(profilePhotoVM: profilePhotoVM)
            .overlay(alignment: .bottomTrailing) {
                PhotosPicker(selection: $profilePhotoVM.selectedImage, matching: .images) {
                    Image(systemName: "pencil.circle.fill")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 30))
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(.borderless)
            }
    }
}

struct CircularProfileImage: View {
    @StateObject var profilePhotoVM: ProfilePhotoViewModel

    var body: some View {
        ProfileImage(profilePhotoVM: profilePhotoVM)
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            .background {
                Circle().fill(
                    LinearGradient(
                        colors: [.yellow, .orange],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
    }
}

struct ProfileImage: View {
    @StateObject var profilePhotoVM: ProfilePhotoViewModel

    var body: some View {
        switch profilePhotoVM.imageState {
            case .success(let image):
                image.resizable()
            case .loading:
                ProgressView()
            case .empty:
                Image(systemName: "person.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            case .failure:
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoView(profilePhotoVM: ProfilePhotoViewModel())
    }
}
