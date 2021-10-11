//
//  ContentView.swift
//  Temperature Converter
//
//  Created by Alpsu Dilbilir on 11.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var value = ""
    @State private var unitChoiceInput = 1
    @State private var unitChoiceOutput = 2
    
    let unitsInput = ["Celcius","Fahrenheit","Kelvin"]
    let unitsOutput = ["Celcius","Fahrenheit","Kelvin"]

    
    var celciusToFahrenheit: Double{
        let inputValue = Double(value) ?? 0
        let result = Double(inputValue * 9/5) + 32
        return result
    }
    
    var celciusToKelvin: Double{
        let inputValue = Double(value) ?? 0
        let result = Double(inputValue + 273.15)
        return result
    }
    
    var fahrenheitToCelcius: Double{
        let inputValue = Double(value) ?? 0
        let result = Double(inputValue - 32) * 5/9
        return result
    }
    
    var fahrenheitToKelvin: Double{
        let inputValue = Double(value) ?? 0
        let result = Double(((inputValue - 32) * 5/9) + 273.15)
        return result
    }
    
    var kelvinToCelcius: Double{
        let inputValue = Double(value) ?? 0
        let result = Double(inputValue - 273.15)
        return result
    }
    
    var kelvinToFahrenheit: Double{
        let inputValue = Double(value) ?? 0
        let result = Double(((inputValue - 273.15)*9/5)+32)
        return result
    }
    var noConversion: Double{
        let inputValue = Double(value) ?? 0
        return inputValue
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Please choose your unit")){
                    Picker("Unit choice:", selection: $unitChoiceInput){
                        ForEach(0 ..< unitsInput.count){
                            Text("\(self.unitsInput[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }.textCase(nil)
                
                Section(header: Text("Please enter the value")){
                    TextField("Value", text: $value)
                }.textCase(nil)
                
                Section(header: Text("Unit that number will be converted to:")){
                    Picker("Unit choice:", selection: $unitChoiceOutput){
                        ForEach(0 ..< unitsOutput.count){
                            Text("\(self.unitsOutput[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }.textCase(nil)
                
                Section(header: Text("Result")){
                    if unitChoiceInput == 0{                                    //If user choose Celsius as input
                        if unitChoiceOutput == 1{                               // If user wants to convert to fahrenheit
                            Text("\(celciusToFahrenheit, specifier: "%.2f") °F")
                        }else if unitChoiceOutput == 2{                         //If user wants to convert to kelvin
                            Text("\(celciusToKelvin, specifier: "%.2f") °K")
                        }else{                                                  //If user wants to celcius to celcius
                            Text("\(noConversion, specifier: "%.2f") °C")
                        }
                    }else if unitChoiceInput == 1{                              //If user choose Fahrenheit as input
                        if unitChoiceOutput == 0{                               // If user wants to convert to celcius
                            Text("\(fahrenheitToCelcius, specifier: "%.2f") °C")
                        }else if unitChoiceOutput == 2{                         // If user wants to convert to kelvin
                            Text("\(fahrenheitToKelvin, specifier: "%.2f") °K")
                        }else{
                            Text("\(noConversion, specifier: "%.2f") °F")
                        }
                    }else{                                                      //If user choose Kelvin as input
                        if unitChoiceOutput == 0{                               //If user wants to convert to celcius
                            Text("\(kelvinToCelcius, specifier: "%.2f") °C")
                        }else if unitChoiceOutput == 1{                         //If user wants to convert to fahrenheit
                            Text("\(kelvinToFahrenheit, specifier: "%.2f") °F")
                        }else{
                            Text("\(noConversion, specifier: "%.2f") °K")
                        }
                    }
                    
                }.textCase(nil)
                
            }
            .navigationTitle("Temperature Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
