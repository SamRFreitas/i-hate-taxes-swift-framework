//
//  Switch.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 08/01/25.
//

import SwiftUI

public struct Switch: View {
    
    @Binding var isOn: Bool // A variável que vai armazenar o estado do Switch

    public var body: some View {
        VStack {
            Toggle(isOn: $isOn) {
                Text("\(isOn ? "Nacional" : "Internacional")") // O título do Switch
            }
            .padding() // Adiciona espaçamento
            .toggleStyle(SwitchToggleStyle(tint: .blue)) // Estiliza o Switch
            .frame(maxWidth: 200, alignment: .center) // Alinha à esquerda
        }
    }
    
}

struct Switch_Previews: PreviewProvider {
    
    @State static var isNational: Bool = false

    static var previews: some View {
        Switch(isOn: $isNational)
            .previewLayout(.sizeThatFits)
            .padding()
    }
    
}
