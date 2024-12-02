//
//  ContentView.swift
//  Meme Generator
//
//  Created by dleegan on 27/11/2024.
//

import SwiftUI

var images: [String] = ["Prince Pepe", "Baby", "Weird Cat", "Doge", "Pepe Homer", "Pika", "Pepe"]

struct ContentView: View {
    @State var selectedImage: String = images[0]
    @State var text: String = ""
    @State var showText: Bool = false
    @State var addShadow: Bool = false
    @State var position: Float = 0.0
    @State var color: Color = .white

    var body: some View {
        VStack {
            VStack {
                Image(selectedImage)
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
                        }
                    }
            }
            .padding()

            Divider()

            ImagesSelector(selectedImage: $selectedImage)

            GeneratorOptions(
                text: $text,
                showText: $showText,
                addShadow: $addShadow,
                position: $position,
                color: $color
            )
        }
    }
}

#Preview {
    ContentView()
}
