//
//  Pizza.swift
//  PizzaSharingCalculator
//
//  Created by Jack William Rathwell on 2025-02-27.
//

import Foundation

struct Pizza {
    
    //MARK: Stored Properties
    
    var numberOfPizzas: Int
    
    var numberOfPeople: Int
    
    var slicesPerPizza: Int
    
        //MARK: Computed Properties
    var totalNumberOfSlices: Int {
        
        // find total number of slices
        return (numberOfPizzas * slicesPerPizza)
    }
    var slicesPerPerson: Int{
        // find slices per person
        return (totalNumberOfSlices / numberOfPeople)
    }
    var remainingSlices: Int{
        // find remaining slices
        return (totalNumberOfSlices % numberOfPeople)
    }
}
