//
//  ImagesSelector.swift
//  Meme Generator
//
//  Created by dleegan on 02/12/2024.
//

import SwiftUI

struct ImagesSelector: View {
    @Binding var selectedImage: String
    @Binding var avatarImage: Image?

    var body: some View {
        ScrollView(
            .horizontal,
            content: {
                HStack(spacing: 10) {
                    ForEach(images, id: \.self) { image in
                        Button {
                            selectedImage = image
                            if avatarImage != nil {
                                avatarImage = nil
                            }
                        } label: {
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(
                                    width: 80,
                                    height: 80,
                                    alignment: .top
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 10
                                    )
                                )
                                .overlay {
                                    if (avatarImage == nil) && selectedImage == image {
                                        VStack {
                                            Image(
                                                systemName: "checkmark.circle.fill"
                                            )
                                            .foregroundStyle(.white)
                                        }
                                        .padding(2)
                                        .frame(
                                            width: 80,
                                            height: 80,
                                            alignment: .topTrailing
                                        )
                                    }
                                }
                        }
                    }

                    UserImage(avatarImage: $avatarImage)
                }
                .padding(.vertical, 10)
            })
            .contentMargins(.horizontal, 10)
    }
}

#Preview {
    @Previewable @State var selectedImage = "Prince Pepe"
    @Previewable @State var avatarImage: Image?

    ImagesSelector(selectedImage: $selectedImage, avatarImage: $avatarImage)
}
