//
//  AmountInput.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 02/01/25.
//

import SwiftUI

struct AmountInput: View {
    var title: String
    @Binding var amount: Double // Valor ligado ao campo de entrada
    
    private var amountFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.currencySymbol = "R$"
        return formatter
    }

    var body: some View {
        VStack {
            Text(title)
                .frame(maxWidth: 200, alignment: .center) // Permite que o título ocupe todo o espaço disponível
                .lineLimit(1)
            TextField("Enter amount", value: $amount, formatter: amountFormatter)
                .padding(8) // Espaçamento interno
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                ) // Adiciona uma borda arredondada
                .frame(maxWidth: 200) // Largura máxima para limitar
                .multilineTextAlignment(.trailing) // Alinha o texto à direita

            // Verifica a versão do macOS antes de usar o onChange
            if #available(macOS 14.0, *) {
                TextField("Enter amount", value: $amount, formatter: amountFormatter)
                    .onChange(of: amount) { _, newValue in
                        amount = validateInput(newValue) // Atualiza o valor após validação
                    }
            } else {
                // Para versões mais antigas, você pode usar uma outra abordagem
                Text("onChange is not available for your macOS version")
            }
        }
        .padding() // Espaçamento geral do componente
    }
    
    private func validateInput(_ input: Double) -> Double {
        // Converte o Double para String
        var inputString = String(input)

        // Regex para permitir apenas números e um único ponto decimal
        let regex = "^[0-9]*\\.?[0-9]{0,2}$"

        if let range = inputString.range(of: regex, options: .regularExpression) {
            // Garante que o valor esteja dentro do padrão
            inputString = String(inputString[range])
        } else {
            // Remove o último caractere inválido
            inputString = String(inputString.dropLast())
        }

        // Converte de volta para Double; retorna 0.0 se a conversão falhar
        return Double(inputString) ?? 0.0
    }
}

struct AmountInput_Previews: PreviewProvider {
    static var previewTitle: String = "Title Teste:"
    @State static var previewAmount: Double = 0.0

    static var previews: some View {
        Group {
            AmountInput(title: previewTitle, amount: $previewAmount)
                .previewDisplayName("Default Preview")

            // Ajuste visual para macOS
            AmountInput(title: previewTitle, amount: $previewAmount)
                .previewDisplayName("macOS-like Preview")
                .frame(width: 400, height: 60)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
