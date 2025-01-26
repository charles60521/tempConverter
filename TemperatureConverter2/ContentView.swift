//
//  ContentView.swift
//  TemperatureConverter2
//
//  Created by Andrew Maldonado on 1/24/25.
// bwesrt projecvt ever

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TemperatureViewModel()
    let measurements = ["Fahrenheit", "Celsius", "Kelvin"]
    @State private var measurementPicked = "Fahrenheit"
    @State private var toBeConverted = ""
    @State private var convertedMeasurement: String = "Type in a temperature and click a button to convert"
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    TextField("Type in Temperature", text: $toBeConverted)
                    Picker("Select a measurement", selection: $measurementPicked) {
                        ForEach(measurements, id: \.self) { measurement in
                            Text(measurement).tag(measurement)
                        }
                        
                    }
                    .padding()
                    
                }
                Text("Converted Measurement")
                    .font(.headline)
                Text("\(convertedMeasurement)")
                    .padding()
                
                Spacer()
                
                Button("Convert to Celcius") {
                    convertToCelcius()
                }
                
                Spacer()
                
                Button("Convert to Fahrenheit") {
                    convertToFahrenheit()
                }
                
                Spacer()
                Button("Convert to Kelvin") {
                    convertToKelvin()
                }
            }
            .padding()
            .navigationTitle("Temperature Converter")
        }
        
        
    }
    func convertToCelcius() {
        if !toBeConverted.isEmpty && measurementPicked == "Fahrenheit" {
            let doubleToBeConverted = Double(toBeConverted)
            let fToCConversion = ((doubleToBeConverted ?? 0) - 32)/1.8
            convertedMeasurement = String(fToCConversion)
        } else if !toBeConverted.isEmpty && measurementPicked == "Celsius" {
            convertedMeasurement = "You already entered Celcius!"
        } else if !toBeConverted.isEmpty && measurementPicked == "Kelvin" {
            let doubleToBeConverted = Double(toBeConverted)
            let kToCConversion = ((doubleToBeConverted ?? 0)) - 273.15
            convertedMeasurement = String(kToCConversion)
        } else if toBeConverted.isEmpty {
            convertedMeasurement = "Please enter a value"
        }
    }
    
    func convertToFahrenheit() {
        if !toBeConverted.isEmpty && measurementPicked == "Celsius" {
            let doubleToBeConverted = Double(toBeConverted)
            let cToFConversion = ((doubleToBeConverted ?? 0) * (9/5)) + 32
            convertedMeasurement = String(cToFConversion)
        } else if !toBeConverted.isEmpty && measurementPicked == "Kelvin" {
            let doubleToBeConverted = Double(toBeConverted)
            let kToFConversion = ((doubleToBeConverted ?? 0) - 273.15) * (9/5) + 32
            convertedMeasurement = String(kToFConversion)
        } else if !toBeConverted.isEmpty && measurementPicked == "Fahrenheit" {
            convertedMeasurement = "You already entered Celcius!"
        } else if toBeConverted.isEmpty {
            convertedMeasurement = "Please enter a value"
        }
    }
    func convertToKelvin() {
        if !toBeConverted.isEmpty && measurementPicked == "Celsius" {
            let doubleToBeConverted = Double(toBeConverted)
            let cToKConversion = (doubleToBeConverted ?? 0) + 273.15
            convertedMeasurement = String(cToKConversion)
        } else if !toBeConverted.isEmpty && measurementPicked == "Kelvin" {
            convertedMeasurement = "You already entered Kelvin!"
        } else if !toBeConverted.isEmpty && measurementPicked == "Fahrenheit" {
            let doubleToBeConverted = Double(toBeConverted)
            let fToKConversion = ((doubleToBeConverted ?? 0) - 32) * 5/9 + 273.15
            convertedMeasurement = String(fToKConversion)
        } else if toBeConverted.isEmpty {
            convertedMeasurement = "Please enter a value"
        }
    }
}


#Preview {
    ContentView()
}
