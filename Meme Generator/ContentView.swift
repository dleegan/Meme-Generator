//
//  ContentView.swift
//  Meme Generator
//
//  Created by dleegan on 27/11/2024.
//

import SwiftUI
import UIKit

var images: [String] = ["Prince Pepe", "Baby", "Weird Cat", "Doge", "Pepe Homer", "Pika", "Pepe"]

struct ContentView: View {
    @State var selectedImage: String = images[0]
    @State var text: String = ""
    @State var showText: Bool = false
    @State var addShadow: Bool = false
    @State var position: Float = 0.0
    @State var color: Color = .white
    @State var galleryImage: Image? = nil

    var body: some View {
        VStack {
            editedImageView
                .padding()

            Divider()

            ImagesSelector(selectedImage: $selectedImage, galleryImage: $galleryImage)

            GeneratorOptions(
                text: $text,
                showText: $showText,
                addShadow: $addShadow,
                position: $position,
                color: $color
            )

            Button {
                if let image = editedImageView.snapshot() {
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                }
            } label: {
                HStack(alignment: .center) {
                    Text("Sauvegarder")
                    Image(systemName: "square.and.arrow.down")
                }
                .bold()
                .foregroundStyle(Color.blue)
                .padding()
                .background(Color.blue.opacity(0.2))
                .clipShape(
                    RoundedRectangle(cornerRadius: 50)
                )
            }
        }
    }

    private var myImage: Image {
        galleryImage ?? Image(selectedImage)
    }

    private var editedImageView: some View {
        VStack {
            myImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: 300,
                    height: 300,
                    alignment: .top
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 10
                    )
                )
                .overlay {
                    if showText {
                        VStack {
                            Text(text)
                                .font(.title)
                                .bold()
                                .foregroundStyle(color)
                                .shadow(
                                    color: color,
                                    radius: addShadow ? 8 : 0
                                )
                                .offset(y: CGFloat(position))
                        }
                        .padding()
                        .frame(width: 300, height: 300)
                        .clipped()
                    }
                }
        }
    }
}

public extension View {
    @MainActor
    func snapshot(scale: CGFloat? = nil) -> UIImage? {
        let renderer = ImageRenderer(content: self)
        renderer.scale = scale ?? UIScreen.main.scale
        return renderer.uiImage
    }
}

#Preview {
    ContentView()
}
