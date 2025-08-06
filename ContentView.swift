import SwiftUI
import SwiftData // read documentation
import UniformTypeIdentifiers



struct IngredientData: Codable {
    let proteins: [String]
    let vegetables: [String]
    let carbs: [String]
}

struct ContentView: View {
    @State private var proteins: [String] = [] // Store proteins
    @State private var vegetables: [String] = [] // Store vegetables
    @State private var carbs: [String] = [] // Store carbs
    @State private var newProtein: String = "" // Input for protein
    @State private var newVegetable: String = "" // Input for vegetable
    @State private var newCarb: String = "" // Input for carb
    @State private var selectedCombo: String = "" // Random meal combo
    @State private var proteinPreps: [String] = [] // Preparation techniques for proteins
    @State private var vegetablePreps: [String] = [] // Preparation techniques for vegetables
    @State private var carbPreps: [String] = [] // Preparation techniques for carbs
    @State private var newProteinPrep: String = "" // Input for protein prep
    @State private var newVegetablePrep: String = "" // Input for vegetable prep
    @State private var newCarbPrep: String = "" // Input for carb prep
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                // Title
                Text("Fridge Friend")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)

                // Protein Section
                VStack(alignment: .leading) {
                    Text("Protein")
                        .font(.headline)
                    TextField("Add protein", text: $newProtein)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        if !newProtein.isEmpty {
                            proteins.append(newProtein)
                            newProtein = ""
                        }
                    }) {
                        Text("Add Protein")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
                .padding(.horizontal)

                // Vegetable Section
                VStack(alignment: .leading) {
                    Text("Vegetables")
                        .font(.headline)
                    TextField("Add vegetable", text: $newVegetable)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        if !newVegetable.isEmpty {
                            vegetables.append(newVegetable)
                            newVegetable = ""
                        }
                    }) {
                        Text("Add Vegetable")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }

                }
                .padding(.horizontal)

                // Carb Section
                VStack(alignment: .leading) {
                    Text("Carbs")
                        .font(.headline)
                    TextField("Add carb", text: $newCarb)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        if !newCarb.isEmpty {
                            carbs.append(newCarb)
                            newCarb = ""
                        }
                    }) {
                        Text("Add Carb")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }

                }
                .padding(.horizontal)
                
                
                NavigationLink(destination: ShareView(
                    proteins: $proteins,
                    vegetables: $vegetables,
                    carbs: $carbs
                )) {
                    Text("Import / Export")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding(.horizontal)
                
                // Generate Combo Button
                Button(action: {
                    if !proteins.isEmpty && !vegetables.isEmpty && !carbs.isEmpty {
                        let randomProtein = proteins.randomElement() ?? ""
                        let randomVegetable = vegetables.randomElement() ?? ""
                        let randomCarb = carbs.randomElement() ?? ""
                        selectedCombo = "\(randomProtein), \(randomVegetable), \(randomCarb)"
                    } else {
                        selectedCombo = "Add at least one item to each category!"
                    }
                }) {
                    Text("Generate Meal Combo")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding(.horizontal)

                // Go to Fridge Button
                NavigationLink(destination: KitchenView(proteins: proteins,
                    vegetables: vegetables,
                    carbs: carbs, proteinPreps: $proteinPreps, vegetablePreps: $vegetablePreps, carbPreps: $carbPreps,newProteinPrep: $newProteinPrep,newVegetablePrep: $newVegetablePrep,newCarbPrep: $newCarbPrep
                )) {
                    Text("Go to Kitchen")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding(.horizontal)
                
                // Go to Fridge Button
                NavigationLink(destination: FridgeView(proteins: proteins, vegetables: vegetables, carbs: carbs)) {
                    Text("Go to Fridge")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding(.horizontal)

                // Display Selected Combo
                Text(selectedCombo.isEmpty ? "No combo selected" : "Meal: \(selectedCombo)")
                    .font(.headline)
                    .padding()

                Spacer()
            }
            .padding()
            .navigationTitle("") // Hide default navigation title
        }
    }
}


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

//Creating a preview in Xcode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
