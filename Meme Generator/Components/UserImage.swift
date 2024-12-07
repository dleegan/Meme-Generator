//
//  UserImage.swift
//  Meme Generator
//
//  Created by dleegan on 05/12/2024.
//

import PhotosUI
import SwiftUI

struct UserImage: View {
    @State private var avatarItem: PhotosPickerItem? = nil
    @Binding var avatarImage: Image?

    var body: some View {
        VStack {
            PhotosPicker(selection: $avatarItem) {
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

//            avatarImage?
//                .resizable()
//                .scaledToFit()
//                .frame(width: 300, height: 300)
        }
        .onChange(of: avatarItem) {
            Task {
                if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                    avatarImage = loaded
                } else {
                    print("Failed")
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var avatarImage: Image?

    UserImage(avatarImage: $avatarImage)
}
