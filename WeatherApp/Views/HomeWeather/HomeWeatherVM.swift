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
                print(self.WeatherData?.city?.name)
            }, failure: { error in
                print(error)
            })
            
            navigateToWeatherView = true
            self.searchText = ""
        } else if self.searchText.isEmpty {
            self.WeatherData = LocalStore.shared.getWeatherData()
        }
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
    
}


    
    struct FahrenheitButton{
        @ObservedObject var viewModel = HomeWeatherViewModel()

//        Button {
//            viewModel.store.selectedUnit = .imperial
//            viewModel.Selection = .imperial
//            viewModel.configManager.checkConnection()
//            viewModel.store.getWeather(success: { weatherData in
//                // Handle successful response with weatherData
//            }, failure: { error in
//                print(error)
//            })
//            
//            viewModel.getData()
//            
//        }
//    label: {
//            HStack {
//                Text("Fahrenheit")
//                if viewModel.store.selectedUnit.rawValue == "imperial"{
//                    
//                    Image(systemName: "checkmark.circle")
//                }
//            }
//        }
    }
    struct CelciusButton{
        @ObservedObject var viewModel = HomeWeatherViewModel()
        
        
//        Button {
//            viewModel.store.selectedUnit = .metric
//            viewModel.Selection = .metric
//            viewModel.configManager.checkConnection()
//            viewModel.store.getWeather(success: { weatherData in
//                // Handle successful response with weatherData
//            }, failure: { error in
//                print(error)
//            })
//                        viewModel.getData()
//        }
//    label: {
//            HStack {
//                Text("Celcius")
//                if viewModel.store.selectedUnit.rawValue == "metric"{
//                    Image(systemName: "checkmark.circle")
//                }
//                
//            }
//        }
    }


