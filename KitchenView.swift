//
//  KitchenView.swift
//  DLMCSPSE01 - Thom Alting von Geusau - FridgeFriend-TEST
//
//  Created by Thom Alting von Geusau on 04/08/2025.
//

import SwiftUI

struct KitchenView: View {
    let proteins: [String]
    let vegetables: [String]
    let carbs: [String]
    @Binding var proteinPreps: [String]
    @Binding var vegetablePreps: [String]
    @Binding var carbPreps: [String]
    @Binding var newProteinPrep: String
    @Binding var newVegetablePrep: String
    @Binding var newCarbPrep: String

    var body: some View {
        VStack(spacing: 20) {
            Text("Your Kitchen")
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
                    .frame(height: CGFloat(proteins.count * 44))
                }
                Text("Protein Preparation Techniques")
                    .font(.subheadline)
                    .padding(.top, 5)
                TextField("Add prep (e.g., Grilled)", text: $newProteinPrep)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    if !newProteinPrep.isEmpty {
                        proteinPreps.append(newProteinPrep)
                        newProteinPrep = ""
                    }
                }) {
                    Text("Add Protein Prep")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                if proteinPreps.isEmpty {
                    Text("No prep techniques added")
                        .italic()
                        .foregroundColor(.gray)
                } else {
                    List(proteinPreps, id: \.self) { prep in
                        Text(prep)
                    }
                    .frame(height: CGFloat(proteinPreps.count * 44))
                }
            }
            .padding(.horizontal)

            // Vegetable Section
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
                    .frame(height: CGFloat(vegetables.count * 44))
                }
                Text("Vegetable Preparation Techniques")
                    .font(.subheadline)
                    .padding(.top, 5)
                TextField("Add prep (e.g., Steamed)", text: $newVegetablePrep)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    if !newVegetablePrep.isEmpty {
                        vegetablePreps.append(newVegetablePrep)
                        newVegetablePrep = ""
                    }
                }) {
                    Text("Add Vegetable Prep")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                if vegetablePreps.isEmpty {
                    Text("No prep techniques added")
                        .italic()
                        .foregroundColor(.gray)
                } else {
                    List(vegetablePreps, id: \.self) { prep in
                        Text(prep)
                    }
                    .frame(height: CGFloat(vegetablePreps.count * 44))
                }
            }
            .padding(.horizontal)

            // Carb Section
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
                    .frame(height: CGFloat(carbs.count * 44))
                }
                Text("Carb Preparation Techniques")
                    .font(.subheadline)
                    .padding(.top, 5)
                TextField("Add prep (e.g., Boiled)", text: $newCarbPrep)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    if !newCarbPrep.isEmpty {
                        carbPreps.append(newCarbPrep)
                        newCarbPrep = ""
                    }
                }) {
                    Text("Add Carb Prep")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                if carbPreps.isEmpty {
                    Text("No prep techniques added")
                        .italic()
                        .foregroundColor(.gray)
                } else {
                    List(carbPreps, id: \.self) { prep in
                        Text(prep)
                    }
                    .frame(height: CGFloat(carbPreps.count * 44))
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("Kitchen Overview")
    }
}
