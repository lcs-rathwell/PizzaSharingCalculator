//
//  Pizza.swift
//  PizzaSharingCalculator
//
//  Created by Jack William Rathwell on 2025-02-27.
//

import Foundation

struct Pizza: Identifiable {
    
    //MARK: Stored Properties
    let id = UUID()
    var numberOfPizzas: Int
    var numberOfPeople: Int
    var slicesPerPizza: Int
    
        //MARK: Computed Properties
    var totalNumberOfSlices: Int {
        return (numberOfPizzas * slicesPerPizza)
    }
    var slicesPerPerson: Int{
        return (totalNumberOfSlices / numberOfPeople)
    }
    var remainingSlices: Int{
        return (totalNumberOfSlices % numberOfPeople)
    }
}
