//
//  PizzaViewModel.swift
//  PizzaSharingCalculator
//
//  Created by Jack William Rathwell on 2025-02-27.
//

import SwiftUI

@Observable
class PizzaViewModel {
    
    // MARK: Stored properties
    
    // Holds whatever the user has typed in the text fields
    var resultHistory: [Pizza] = []
    var providedNumberOfPizzas: String
    var providedNumberOfPeople: String
    var providedSlicesPerPizza: String
    
    // Holds an appropriate error message, if there was a
    // problem with input provided by the user
    var recoverySuggestion: String = ""
    
    // MARK: Computed properties
    // Holds the evaluated power, when the input provided is valid
    var conversionResult: Pizza? {
        
        guard let numberOfPizzas = Int(providedNumberOfPizzas), numberOfPizzas > 0 else {
            recoverySuggestion = "Please provide a positive value for the number of pizzas"
            
            return nil
        }
        
        guard let numberOfPeople = Int(providedNumberOfPeople), numberOfPeople > 0 else {
            recoverySuggestion = "Please provide a positive value for the number of people"
            
            return nil
        }
        
        guard let slicesPerPizza = Int(providedSlicesPerPizza), numberOfPizzas > 0 else {
            recoverySuggestion = "Please provide a positive value for the slices per pizza"
            
            return nil
        }
 
        
        // Now that we know the base and exponent have valid values, return the result
        recoverySuggestion = "" // No error message
        return Pizza(numberOfPizzas: numberOfPizzas, numberOfPeople: numberOfPeople, slicesPerPizza: slicesPerPizza)
        
    }
    
    //INITIALIZERS
    init(providedNumberOfPizzas: String, providedNumberOfPeople: String, providedSlicesPerPizza: String, recoverySuggestion: String) {
        self.providedNumberOfPizzas = providedNumberOfPizzas
        self.providedNumberOfPeople = providedNumberOfPeople
        self.providedSlicesPerPizza = providedSlicesPerPizza
        self.recoverySuggestion = recoverySuggestion
    }
    func saveResult() {
        
        if let conversionResult = self.conversionResult {
            
            self.resultHistory.insert(conversionResult, at: 0)
            
        }
    }
}

