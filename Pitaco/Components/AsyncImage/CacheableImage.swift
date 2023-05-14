//
//  CachableImage.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 14/01/23.
//
import Foundation
import SwiftUI

private class ImageCache {
    static var images: [String: Data] = [:]
}

struct CachableImage: View {
    @State var imageData: Data?
    let urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }
    
    var body: some View {
        if let data = imageData {
            Image(data: data)?
                .resizable()
                .scaledToFill()
                .clipped(antialiased: true)
        } else {
            ProgressView().progressViewStyle(.circular)
                .onAppear {
                    fetch()
                }
        }
    }
    
    @MainActor
    private func fetch() {
        if let data = ImageCache.images[urlString] {
            imageData = data
        } else {
            Task {
                do {
                    let (data, _) = try await URLSession.shared.data(from: URL(string: urlString)!)
                    ImageCache.images[urlString] = data
                    self.imageData = data
                } catch let error {
                    print(error)
                }
            }
        }
    }
}
