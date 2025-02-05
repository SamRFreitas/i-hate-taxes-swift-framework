//
//  FormExpenseSettings.swift
//  IHateTaxes
//
//  Created by Samuel R de Freitas on 08/01/25.
//

import SwiftUI

public struct FormExpenseSettings: View {
    
    @State public  var minimumWage: Double = 0.0
    @State public var proLaborePercentage: Double = 0.0
    @State public var contabilizeiMonthlyFee: Double = 0.0
    @State public var rental: Double = 0.0
    @State public var digitalSignature: Double = 0.0
    @State public var numberOfMonthsToSaveMoney: Int = 12
    @State public var isNational: Bool = false
    
    public init(
        minimumWage: Double = 0.0,
        proLaborePercentage: Double = 0.0,
        contabilizeiMonthlyFee: Double = 0.0,
        rental: Double = 0.0,
        digitalSignature: Double = 0.0,
        numberOfMonthsToSaveMoney: Int = 12,
        isNational: Bool = false
    ) {
        self._minimumWage = State(initialValue: minimumWage)
        self._proLaborePercentage = State(initialValue: proLaborePercentage)
        self._contabilizeiMonthlyFee = State(initialValue: contabilizeiMonthlyFee)
        self._rental = State(initialValue: rental)
        self._digitalSignature = State(initialValue: digitalSignature)
        self._numberOfMonthsToSaveMoney = State(initialValue: numberOfMonthsToSaveMoney)
        self._isNational = State(initialValue: isNational)
    }
    
    
    public var body: some View {
        
        ScrollView {
            
            VStack {
                
                
                if #available(macOS 12.0, *) {
                    #if os(macOS)
                                        
                        HStack {
                            AmountInput(title: "Salário Mínimo", amount: $minimumWage, mode: .currency)
                            AmountInput(title: "Porcentagem Pró-Labore", amount: $proLaborePercentage, mode: .percentage)
                            AmountInput(title: "Mensalidade Contabilizei", amount: $contabilizeiMonthlyFee, mode: .currency)
                        }
                        
                        HStack {
                            AmountInput(title: "Aluguel", amount: $rental, mode: .currency)
                            AmountInput(title: "Assinatura Digital", amount: $digitalSignature, mode: .currency)
                            
                        }
                        
                        VStack {
                            NumberOfMonthsPicker(selectedMonth: $numberOfMonthsToSaveMoney)
                            Switch(isOn: $isNational)
                        }
                                        
                    #else
                    
                    AmountInput(title: "Salário Mínimo", amount: $minimumWage, mode: .currency)
                    AmountInput(title: "Porcentagem Pró-Labore", amount: $proLaborePercentage, mode: .percentage)
                    AmountInput(title: "Mensalidade Contabilizei", amount: $contabilizeiMonthlyFee,mode: .currency)
                    AmountInput(title: "Aluguel", amount: $rental, mode: .currency)
                    AmountInput(title: "Assinatura Digital", amount: $digitalSignature, mode: .currency)
                    NumberOfMonthsPicker(selectedMonth: $numberOfMonthsToSaveMoney)
                    Switch(isOn: $isNational)
                    
                    #endif
                } else {
                    // Fallback on earlier versions
                }
                
                Button("Salvar", action: {
                    
                    print("Salvar os dados do Expense Settings")
                    
                })
            }
            .padding()
            
        }
        
    }
    
    
}

struct FormExpenseSettings_Previews: PreviewProvider {
    
    
    static var previews: some View {
        FormExpenseSettings()
            .frame(width: 800, height: 400)
    }
    
    
}


