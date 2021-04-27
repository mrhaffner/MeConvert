//
//  ContentView.swift
//  MeConvert
//
//  Created by Matt Haffner on 4/26/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let inputUnits = ["Meters", "Centimers", "Feet", "Inches"]
    let outputUnits = ["Matts", "Furlongs", "Shaqs", "Football Fields", "Eiffel Towers"]
    
    var inputInMeters: Double {
        let convertedInput = Double(inputNumber) ?? 0
        switch self.inputUnit {
        case 1:
            return convertedInput / 100
        case 2:
            return convertedInput / 3.281
        case 3:
            return convertedInput / 39.37
        default:
            return convertedInput
        }
    }
    
    var convertedOutput: Double {
        switch self.outputUnit {
        case 0:
            return (self.inputInMeters * 3.281) / 6
        case 1:
            return self.inputInMeters / 201
        case 2:
            return (self.inputInMeters * 39.37) / 85
        case 3:
            return self.inputInMeters / 324
        default:
            return self.inputInMeters / 324
        }
            
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Your height", text: $inputNumber)
                        .keyboardType(.decimalPad)
                    Picker("Input Units", selection: $inputUnit) {
                        ForEach(0 ..< inputUnits.count) {
                            Text("\(self.inputUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("How you measure up")) {
                    Picker("Output Units", selection: $outputUnit) {
                        ForEach(0 ..< outputUnits.count) {
                            Text("\(self.outputUnits[$0])")
                        }
                    }
                    Text("\(self.convertedOutput)")

                }
            }
            .navigationTitle("MeConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
