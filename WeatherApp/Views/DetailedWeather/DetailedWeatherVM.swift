//
//  DetailedWeatherViewModel.swift
//  WeatherApp
//
//  Created by apple on 10/17/23.
//

import Foundation
import SwiftUI

class DetailedWeatherViewModel : ObservableObject {
    
    @Published var modelData: WeatherModel?
    @Published var selectedUnits: Units?
    @Published var select = "˚C"
    var store = StoreManager.shared
    init(modelData: WeatherModel? = nil, selectedUnits: Units? = nil) {
        self.modelData = modelData
        self.selectedUnits = selectedUnits
        Selection(unit: self.selectedUnits!)
        storeData()
    }
    
    func storeData(){
        if let modelData = self.modelData,let selectedUnits = self.selectedUnits{
//            WeatherHeaderVM(model: modelData, selectedUnits: selectedUnits)
            HourlyForecastVM(model: modelData, selectedUnits: selectedUnits)
            DailyForecastVM(model: modelData, selectedUnits: selectedUnits)
            store.isFetchingWeather = false
        }
    }
    
//    func WeatherHeaderVM(model: WeatherModel, selectedUnits: Units)-> WeatherHeaderViewModel{
//        let viewModel = WeatherHeaderViewModel()
//        viewModel.model = model
//        viewModel.selectedUnits = selectedUnits
//        return viewModel
//    }
    func HourlyForecastVM(model: WeatherModel, selectedUnits: Units){
        HourlyForecastViewModel(model: model, selectedUnits: selectedUnits)
    }
    func DailyForecastVM(model: WeatherModel, selectedUnits: Units){
        DailyForecastViewModel(model: model, selectedUnits: selectedUnits)
    }
    func Selection(unit: Units) {
        selectedUnits = unit
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

//class WeatherHeaderViewModel : ObservableObject {
//    
//    @Published var model: WeatherModel
//    @Published var selectedUnits: Units
//    @Published var select = "˚C"
//    var store = StoreManager.shared
//    init() {
//        self.model = model
//        self.selectedUnits = selectedUnits
//        Selection(unit: self.selectedUnits)
//    }
//    
//    
//    func Selection(unit: Units) {
//        selectedUnits = unit
//        store.getWeather(success: { _ in }, failure: { _ in })
//        if unit == .metric {
//            select = "˚C"
//        }
//        else if unit == .imperial
//        {
//            select = "˚F"
//        }
//    }
//}
class HourlyForecastViewModel : ObservableObject {
    
    @Published var model: WeatherModel
    @Published var selectedUnits: Units
    
    init(model: WeatherModel, selectedUnits: Units) {
        self.model = model
        self.selectedUnits = selectedUnits
       
    }
    
    
    

}
class DailyForecastViewModel : ObservableObject {
    
    @Published var model: WeatherModel
    @Published var selectedUnits: Units
    init(model: WeatherModel, selectedUnits: Units) {
        self.model = model
        self.selectedUnits = selectedUnits
        
    }
    

    
}

class HourlyWeatherViewModel : ObservableObject{
    @Published var hourlyData: HourlyWeather
    @Published var selectedUnits: Units
    @Published var select = "˚C"
    var store = StoreManager.shared
    
    init(hourlyData: HourlyWeather, selectedUnits: Units) {
        self.hourlyData = hourlyData
        self.selectedUnits = selectedUnits
        Selection(unit: selectedUnits)
    }
    
    func Selection(unit: Units) {
        selectedUnits = unit
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

class DailyWeatherViewModel : ObservableObject{
    @Published var dailymodel: DailyWeather
    @Published var selectedUnits: Units
    @Published var select = "˚C"
    var store = StoreManager.shared
    
    init(dailyData: DailyWeather, selectedUnits: Units) {
        self.dailymodel = dailyData
        self.selectedUnits = selectedUnits
        Selection(unit: selectedUnits)
    }
    
    func Selection(unit: Units) {
        selectedUnits = unit
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
