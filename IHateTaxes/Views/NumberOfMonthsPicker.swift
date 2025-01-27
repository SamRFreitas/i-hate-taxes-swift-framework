//
//  NumberOfMonthsPicker.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 08/01/25.
//

import SwiftUI

struct NumberOfMonthsPicker: View {
    @Binding var selectedMonth: Int
    
    var body: some View {
        VStack {
            Text("Escolha o número de meses")
            
            Picker("Meses", selection: $selectedMonth) {
                ForEach(1..<13) { month in
                    Text("\(month) \(month == 1 ? "mês" : "meses" )")
                        .tag(month)
                }
            }
            // Usar o onChange para o @Binding
            .onChange(of: selectedMonth) { newValue in
                selectedMonth = newValue
            }

            #if os(macOS)
                .pickerStyle(MenuPickerStyle()) // Usado para macOS
            #else
                .pickerStyle(WheelPickerStyle()) // Usado para iOS
            #endif
            .clipped() // Garante que o picker não ultrapasse o limite de sua área
        }
        .padding()
    }
}

struct NumberOfMonthsPicker_Previews: PreviewProvider {
    @State static var selectedMonth = 12

    static var previews: some View {
        NumberOfMonthsPicker(selectedMonth: $selectedMonth)
            .previewLayout(.sizeThatFits)
            .padding()
            .frame(width: 300, height: 300)
    }
}

