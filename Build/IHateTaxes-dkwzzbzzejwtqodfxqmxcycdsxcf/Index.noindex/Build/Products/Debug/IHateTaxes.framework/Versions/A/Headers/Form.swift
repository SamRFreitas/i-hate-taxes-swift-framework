//
//  Form.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 02/01/25.
//

import SwiftUI

public struct Form: View {
    
    private var title: String = "Valor Recebido:"
    @State private var amount: Double = 0.0
    
    public var body: some View {
        
        VStack {
            if #available(macOS 12.0, *) {
                AmountInput(title: title, amount: $amount, mode: .currency)
            } else {
                // Fallback on earlier versions
            }
            
            Button("Confirmar", action: {
                // Aqui você pode fazer algo com o valor inserido
                let expenseSettings = ExpenseSettings(minimumWage: 1412, proLaborePercentage: 28, contabilizeiMonthlyFee: 120, rental: 647, digitalSignature: 235, numberOfMonthsToSaveMoney: 12, isNational: false)
                
                let vrau = Vrau(amount: amount, expenseSettings: expenseSettings)
                vrau.configure()
                
                print("------------------------------------------")
                print("Contabilizei-----------------\(vrau.expenseSettings.contabilizeiMonthlyFee)")
                print("INSS-------------------------\(vrau.inss!.getTax())")
                print("IRRF-------------------------\(vrau.inss!.getIrrfTax())")
                print("DAS--------------------------\(vrau.das!.getTax())")
                print("Despesas Anuais--------------\(vrau.expenseSettings.getFundsEarmarkedForAnnualBills())")
                print("Pró-Labore------------------\(vrau.inss!.proLabore)")
                print("DLA--------------------------\(vrau.getDla())")
                print("Total de Imposto--------------\(vrau.inss!.getTax() + vrau.inss!.getIrrfTax() + vrau.das!.getTax())")
                print("Lucro------------------------\(vrau.inss!.proLabore + vrau.getDla())")
                print("------------------------------------------")
            })
        }
        .padding()
    }
    
}

struct Form_Previews: PreviewProvider {
    
    
    static var previews: some View {
        Form()
    }
    
    
}
