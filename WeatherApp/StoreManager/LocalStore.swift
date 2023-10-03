//
//  LocalStore.swift
//  WeatherApp
//
//  Created by apple on 10/3/23.
//

import Foundation
import SwiftUI

class LocalStore{
    static let shared = LocalStore()
    
    @Published var weatherData: WeatherModel?

    internal init() { }
    func getWeatherData() -> WeatherModel? {
        if let jsonURL = Bundle.main.url(forResource: "modelData", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: jsonURL)
                let decoder = JSONDecoder()
                let weatherModel = try decoder.decode(WeatherModel.self, from: jsonData)
                weatherData = weatherModel
                return weatherData
            } catch {
                print("Error loading and saving JSON data: \(error)")
            }
        }
        else
        {
            print("JSON file not found")
        }
        return weatherData
    }
    
    
}
