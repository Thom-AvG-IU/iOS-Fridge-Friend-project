//
//  IngredientLogic4Test.swift
//  DLMCSPSE01 - Thom Alting von Geusau - FridgeFriend-TEST
//
//  Created by Thom Alting von Geusau on 06/08/2025.
//

// For unit test to test essential features
func generateMealCombo(proteins: [String], vegetables: [String], carbs: [String]) -> String {
    guard !proteins.isEmpty, !vegetables.isEmpty, !carbs.isEmpty else {
        return "Add at least one item to each category!"
    }
    
    let protein = proteins.randomElement() ?? ""
    let vegetable = vegetables.randomElement() ?? ""
    let carb = carbs.randomElement() ?? ""
    return "\(protein), \(vegetable), \(carb)"
}

func addIngredient(_ input: String, to list: inout [String]) {
    if !input.isEmpty {
        list.append(input)
    }
}
