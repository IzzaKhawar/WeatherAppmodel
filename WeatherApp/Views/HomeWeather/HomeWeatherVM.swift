//
//  HomeWeatherVM.swift
//  WeatherApp
//
//  Created by apple on 10/17/23.
//

import Foundation
import SwiftUI


class HomeWeatherViewModel: ObservableObject {
    @Published var navigateToWeatherView = false
    @Published var WeatherData: WeatherModel?
    @Published var Selection: Units = .metric
    @State private var select : String = "˚C"
    @Published var searchText = ""
    var store = StoreManager.shared
    let configManager = ConfigManager()
            
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }

        
    func submit() {
        if !(self.searchText.isEmpty) {
            self.WeatherData = nil
            store.cityName = self.searchText
            store.getWeather(success: { response in
                self.WeatherData = response
            }, failure: { error in
                print(error)
            })
            if ((WeatherData?.city?.name?.isEmpty) != nil){
                WeatherViewVM(model: WeatherData!, selectedUnits: Selection)
            }
            
            navigateToWeatherView = true
            self.searchText = ""
        } else if self.searchText.isEmpty {
            self.WeatherData = LocalStore.shared.getWeatherData()
        }
    }
    func WeatherViewVM(model: WeatherModel, selectedUnits: Units){
        store.isFetchingWeather = false
        DetailedWeatherViewModel(modelData: model, selectedUnits: selectedUnits)
    }
    
    func selectedUnits(unit: Units) {
        store.selectedUnit = unit
        Selection = unit
        store.getWeather(success: { _ in }, failure: { _ in })
        if unit == .metric {
            select = "˚C"
        }
        else if unit == .imperial
        {
            select = "˚F"
        }
    }
    
    func setUnitToMetric() {
        store.selectedUnit = .metric
        Selection = .metric
        configManager.checkConnection()
        store.getWeather(success: {_ in  }
         , failure: { error in
            print(error)
        })
    }
    
    func setUnitToImperial() {
        store.selectedUnit = .imperial
        Selection = .imperial
        configManager.checkConnection()
        store.getWeather(success: { _ in  }
         , failure: { error in
            print(error)
        })
    }
    
    
}


