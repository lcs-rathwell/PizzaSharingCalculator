//
//  ContentView.swift
//  PizzaSharingCalculator
//
//  Created by Jack William Rathwell on 2025-02-27.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State var viewModel = PizzaViewModel()
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // OUTPUT
            if let conversionResult = viewModel.conversionResult {
                
                VStack(spacing: 0) {
                    
                    PizzaItemView(conversionResult: conversionResult)
                        .padding(.bottom, 30)
                    
                    // Add a button so that the result can be saved
                    Button {
                        viewModel.saveResult()
                        // DEBUG: Show how many items are in the resultHistory array
                        print("There are \(viewModel.resultHistory.count) elements in the resultHistory array.")
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
                .frame(height: 250)
                
            } else {
                ContentUnavailableView("Unable to perform conversion", systemImage: "gear.badge.questionmark", description: Text(viewModel.recoverySuggestion))
                    .frame(height: 250)

            }
            
            // INPUT
            TextField("Enter a number of pizzas", text: $viewModel.providedNumberOfPizzas)
                .textFieldStyle(.roundedBorder)
            
            TextField("Enter a number of slices per pizza", text: $viewModel.providedSlicesPerPizza)
                .textFieldStyle(.roundedBorder)
            
            TextField("Enter a number of people", text: $viewModel.providedNumberOfPeople)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Text("History")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            .padding(.top)
            
            // Iterate over the list of results
            List(viewModel.resultHistory) { currentResult in
                
                PizzaItemView(conversionResult: currentResult)
                
            }
            .listStyle(.plain)
            
            
        }
        .navigationTitle("Pizza Sharing Calculator")
        .padding()
    }
}

#Preview {
    NavigationStack {
       ContentView()
    }
}
