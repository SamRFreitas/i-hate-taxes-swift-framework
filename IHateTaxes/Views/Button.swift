//
//  Button.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 02/01/25.
//

import SwiftUI

struct SimpleButton: View {
    var title: String // Título do botão
    var action: () -> Void // Ação a ser executada quando o botão for pressionado

    var body: some View {
        Button(action: action) {
            Text(title) // Aqui, o título é passado como um Text dentro do fechamento
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity) // Expande o botão para toda a largura possível
                .background(Color.blue) // Cor de fundo
                .foregroundColor(.white) // Cor do texto
                .cornerRadius(8) // Bordas arredondadas
                .padding() // Espaçamento extra para o botão
        }
        .buttonStyle(PlainButtonStyle()) // Adicionando estilo básico, que funciona bem em ambas as plataformas
    }
}

struct SimpleButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SimpleButton(title: "Clique aqui", action: { print("Botão pressionado") })
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("iOS")
                .frame(width: 300, height: 60) // Dimensões para o iOS

            SimpleButton(title: "Clique aqui", action: { print("Botão pressionado") })
                .previewLayout(.sizeThatFits)
                .padding()
                .previewDisplayName("macOS")
                .frame(width: 300, height: 60) // Dimensões para o macOS
        }
    }
}
