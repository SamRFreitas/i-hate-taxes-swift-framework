import SwiftUI

@available(macOS 12.0, *)
public struct AmountInput: View {
    var title: String
    @Binding var amount: Double
    var mode: InputMode
    
    @State private var textValue: String = ""
    @FocusState private var isFocused: Bool
    
    enum InputMode {
        case currency
        case percentage
    }

    public var body: some View {
        VStack {
            Text(title)
                .frame(maxWidth: 200, alignment: .center)
                .lineLimit(1)

            TextField("Enter amount", text: $textValue)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                )
                .frame(maxWidth: 200)
                .multilineTextAlignment(.trailing)
                #if os(iOS)
                .keyboardType(.decimalPad)
                #endif
                .focused($isFocused)
                .onTapGesture { // Limpa o campo ao clicar
                    textValue = ""
                }
                .onChange(of: isFocused) { newValue in
                    if newValue {
                        // Ao entrar no campo: campo fica vazio
                        textValue = ""
                    } else {
                        // Ao sair do campo: formata o valor
                        textValue = formatValue(amount)
                    }
                }
                .onChange(of: textValue) { newValue in
                    if isFocused {
                        // Filtra caracteres inválidos
                        textValue = filterInput(newValue)
                        
                        // Converte para Double
                        if let validAmount = Double(textValue.replacingOccurrences(of: ",", with: ".")) {
                            amount = validAmount
                        }
                    }
                }
                .onAppear {
                    // Formata o valor inicial
                    textValue = formatValue(amount)
                }
        }
        .padding()
    }
    
    private func filterInput(_ input: String) -> String {
        let filtered = input
            .filter { $0.isNumber || $0 == "." || $0 == "," }
            .replacingOccurrences(of: ".", with: ",")
        
        // Permite apenas uma vírgula
        let parts = filtered.components(separatedBy: ",")
        if parts.count > 2 {
            return parts[0] + "," + parts[1]
        }
        return filtered
    }
    
    private func formatValue(_ value: Double) -> String {
        switch mode {
        case .currency:
            return String(format: "R$ %.2f", value).replacingOccurrences(of: ".", with: ",")
        case .percentage:
            return String(format: "%.2f%%", value).replacingOccurrences(of: ".", with: ",")
        }
    }
}

struct AmountInput_Previews: PreviewProvider {
    static var previewTitle: String = "Title Teste:"
    @State static var previewAmount: Double = 0.0

    static var previews: some View {
        Group {
            if #available(macOS 12.0, *) {
                AmountInput(title: previewTitle, amount: $previewAmount, mode: .currency)
                    .previewDisplayName("Default Preview")
            } else {
                // Fallback on earlier versions
            }

            if #available(macOS 12.0, *) {
                AmountInput(title: previewTitle, amount: $previewAmount, mode: .currency)
                    .previewDisplayName("macOS-like Preview")
                    .frame(width: 400, height: 60)
            } else {
                // Fallback on earlier versions
            }
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
