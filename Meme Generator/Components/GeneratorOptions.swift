//
//  GeneratorOptions.swift
//  Meme Generator
//
//  Created by dleegan on 02/12/2024.
//

import SwiftUI

struct GeneratorOptions: View {
    @Binding var text: String
    @Binding var showText: Bool
    @Binding var addShadow: Bool
    @Binding var position: Float
    @Binding var color: Color

    var body: some View {
        VStack(spacing: 20) {
            Toggle(isOn: $showText) {
                Text("Texte")
                    .font(.title3)
                    .bold()
            }

            if showText {
                VStack {
                    TextField("Votre Text", text: $text)
                        .textFieldStyle(.roundedBorder)

                    Toggle(isOn: $addShadow) {
                        Text("Ombre")
                    }

                    HStack {
                        Text("Position")
                        Slider(value: $position, in: -130 ... 130)
                    }

                    ColorPicker("Couleur", selection: $color)
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var text = ""
    @Previewable @State var showText = false
    @Previewable @State var addShadow = false
    @Previewable @State var position: Float = 0.0
    @Previewable @State var color = Color.blue

    GeneratorOptions(
        text: $text,
        showText: $showText,
        addShadow: $addShadow,
        position: $position,
        color: $color
    )
}
