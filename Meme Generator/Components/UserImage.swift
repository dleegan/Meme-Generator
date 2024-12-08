//
//  UserImage.swift
//  Meme Generator
//
//  Created by dleegan on 05/12/2024.
//

import PhotosUI
import SwiftUI

struct UserImage: View {
    @State private var galleryItem: PhotosPickerItem? = nil
    @Binding var galleryImage: Image?

    var body: some View {
        VStack {
            PhotosPicker(selection: $galleryItem) {
                RoundedRectangle(
                    cornerRadius: 10
                )
                .fill(.gray)
                .frame(
                    width: 80,
                    height: 80,
                    alignment: .top
                )
                .overlay(content: {
                    VStack(spacing: 5) {
                        Image(systemName: "photo")
                            .foregroundStyle(.white)
                        Text("Vos images")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.caption2)
                    }
                })
            }
        }
        .onChange(of: galleryItem) {
            Task {
                if let loaded = try? await galleryItem?.loadTransferable(type: Image.self) {
                    galleryImage = loaded
                } else {
                    print("Failed")
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var galleryImage: Image?

    UserImage(galleryImage: $galleryImage)
}
