//
//  ShareView.swift
//  DLMCSPSE01 - Thom Alting von Geusau - FridgeFriend-TEST
//
//  Created by Thom Alting von Geusau on 04/08/2025.
//

import SwiftUI
import UniformTypeIdentifiers

struct ShareView: View {
    @Binding var proteins: [String]
    @Binding var vegetables: [String]
    @Binding var carbs: [String]
    
    @State private var showExporter = false
    @State private var showImporter = false
    @State private var jsonData: Data? = nil
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Share Data")
                .font(.title)
                .fontWeight(.bold)
            
            Button("Export JSON") {
                do {
                    let ingredientData = IngredientData(proteins: proteins, vegetables: vegetables, carbs: carbs)
                    let encoded = try JSONEncoder().encode(ingredientData)
                    jsonData = encoded
                    showExporter = true
                } catch {
                    alertMessage = "Failed to export JSON: \(error.localizedDescription)"
                    showAlert = true
                }
            }
            .buttonStyle(.borderedProminent)
            .fileExporter(
                isPresented: $showExporter,
                document: JSONFile(data: jsonData ?? Data(), name: "Ingredients"),
                contentType: .json,
                defaultFilename: "Ingredients"
            ) { result in
                if case .failure(let error) = result {
                    alertMessage = "Export failed: \(error.localizedDescription)"
                    showAlert = true
                }
            }
            
            Button("Import JSON") {
                showImporter = true
            }
            .buttonStyle(.bordered)
            .fileImporter(
                isPresented: $showImporter,
                allowedContentTypes: [.json],
                allowsMultipleSelection: false
            ) { result in
                do {
                    guard let url = try result.get().first else { return }
                    let data = try Data(contentsOf: url)
                    let decoded = try JSONDecoder().decode(IngredientData.self, from: data)
                    proteins = decoded.proteins
                    vegetables = decoded.vegetables
                    carbs = decoded.carbs
                    alertMessage = "Import successful!"
                    showAlert = true
                } catch {
                    alertMessage = "Import failed: \(error.localizedDescription)"
                    showAlert = true
                }
            }

            Spacer()
        }
        .padding()
        .alert("Info", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
}
