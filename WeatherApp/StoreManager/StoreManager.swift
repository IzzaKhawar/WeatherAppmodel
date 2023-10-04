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
    @Published var weatherData: WeatherModel?
  
    internal init() {}
    
    func getWeather()  -> WeatherModel? {
        switch configManager.config {
        case .remote:
                RemoteStore.shared.getWeatherByCityName()
                weatherData = RemoteStore.shared.weatherData
                return weatherData
                
        case .local:
                weatherData =  LocalStore.shared.getWeatherData()
                return  weatherData
        }
    }
}
