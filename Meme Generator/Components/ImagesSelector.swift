//
//  ImagesSelector.swift
//  Meme Generator
//
//  Created by dleegan on 02/12/2024.
//

import SwiftUI

struct ImagesSelector: View {
    @Binding var selectedImage: String

    var body: some View {
        ScrollView(.horizontal, content: {
            HStack(spacing: 10) {
                ForEach(images, id: \.self) { image in
                    Button {
                        selectedImage = image
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
                                if selectedImage == image {
                                    VStack {
                                        Image(systemName: "checkmark.circle.fill")
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
            }
            .padding(.vertical, 10)
        })
        .contentMargins(.horizontal, 10)
    }
}

#Preview {
    @Previewable @State var selectedImage = "Prince Pepe"
    ImagesSelector(selectedImage: $selectedImage)
}
