//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//

import SwiftUI


@main
struct WeatherAppApp: App {
    @StateObject var homeWeatherViewModel = HomeWeatherViewModel()
    @StateObject var weatherCoordinator = WeatherCoordinator()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homeWeatherViewModel)
                .environmentObject(weatherCoordinator)
        }
    }
}
