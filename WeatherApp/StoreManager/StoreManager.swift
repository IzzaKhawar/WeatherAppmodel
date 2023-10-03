//
//  StoreManager.swift
//  WeatherApp
//
//  Created by apple on 10/3/23.
//

import Foundation

class StoreManager : ObservableObject{
    static let shared = StoreManager()
    let configManager = ConfigManager()
    
    internal init() {}
    
    func getWeather()  -> WeatherModel? {
        switch configManager.config {
        case .remote:
                return RemoteStore.shared.weatherData
                
        case .local:
                return  LocalStore.shared.weatherData
        }
    }
}
