//
//  DLMCSPSE01___Thom_Alting_von_Geusau___FridgeFriend_TESTApp.swift
//  DLMCSPSE01 - Thom Alting von Geusau - FridgeFriend-TEST
//
//  Created by Thom Alting von Geusau on 31/07/2025.
//

import SwiftUI
import SwiftData

@main
struct DLMCSPSE01___Thom_Alting_von_Geusau___FridgeFriend_TESTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

@Model
class IngredientCategory {
    var type: String  // "protein", "vegetable", "carb"
    var items: [String]

    init(type: String, items: [String] = []) {
        self.type = type
        self.items = items
    }
}
