//
//  FridgeView.swift
//  DLMCSPSE01 - Thom Alting von Geusau - FridgeFriend-TEST
//
//  Created by Thom Alting von Geusau on 04/08/2025.
//

import SwiftUI

struct FridgeView: View {
    let proteins: [String]
    let vegetables: [String]
    let carbs: [String]

    var body: some View {
        VStack(spacing: 10) {
            Text("Your Fridge")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)

            // Protein Section
            VStack(alignment: .leading) {
                Text("Proteins")
                    .font(.headline)
                if proteins.isEmpty {
                    Text("No proteins added")
                        .italic()
                        .foregroundColor(.gray)
                } else {
                    List(proteins, id: \.self) { protein in
                        Text(protein)
                    }
                    .frame(height: CGFloat(150))
                }
            }
            .padding(.horizontal)

            // Vegetable drawer
            VStack(alignment: .leading) {
                Text("Vegetables")
                    .font(.headline)
                if vegetables.isEmpty {
                    Text("No vegetables added")
                        .italic()
                        .foregroundColor(.gray)
                } else {
                    List(vegetables, id: \.self) { vegetable in
                        Text(vegetable)
                    }
                    .frame(height: CGFloat(150))
                }
            }
            .padding(.horizontal)

            // Carb section
            VStack(alignment: .leading) {
                Text("Carbs")
                    .font(.headline)
                if carbs.isEmpty {
                    Text("No carbs added")
                        .italic()
                        .foregroundColor(.gray)
                } else {
                    List(carbs, id: \.self) { carb in
                        Text(carb)
                    }
                    .frame(height: CGFloat(150))
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("Fridge Overview")
    }
}
