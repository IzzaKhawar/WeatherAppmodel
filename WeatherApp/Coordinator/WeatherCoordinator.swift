//
//  WeatherCoordinator.swift
//  WeatherApp
//
//  Created by apple on 10/19/23.
//

import Foundation
import SwiftUI

class WeatherCoordinator: ObservableObject {
    enum Screen {
        case weather
        
    }
    
    @Published var currentScreen: Screen = .weather
    
    func navigateTo(screen: Screen) {
        currentScreen = screen
    }
}
