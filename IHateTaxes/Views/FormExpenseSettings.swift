//
//  FormExpenseSettings.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 08/01/25.
//

import SwiftUI

struct FormExpenseSettings: View {
    
    @State private var minimumWage: Double = 0.0
    @State private var proLaborePercentage: Double = 0.0
    @State private var contabilizeiMonthlyFee: Double = 0.0
    @State private var rental: Double = 0.0
    @State private var digitalSignature: Double = 0.0
    @State private var numberOfMonthsToSaveMoney: Int = 12
    @State private var isNational: Bool = false
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                AmountInput(title: "Salário Mínimo", amount: $minimumWage)
                AmountInput(title: "Porcentagem Pró-Labore", amount: $proLaborePercentage)
                AmountInput(title: "Mensalidade Contabilizei", amount: $contabilizeiMonthlyFee)
                AmountInput(title: "Aluguel", amount: $rental)
                AmountInput(title: "Assinatura Digital", amount: $digitalSignature)
                NumberOfMonthsPicker(selectedMonth: $numberOfMonthsToSaveMoney)
                Switch(isOn: $isNational)
                
            }
            .padding()
            
        }
        
    }
    
    
}

struct FormExpenseSettings_Previews: PreviewProvider {
    
    
    static var previews: some View {
        FormExpenseSettings()
            .frame(width: 500, height: 600)
    }
    
    
}


