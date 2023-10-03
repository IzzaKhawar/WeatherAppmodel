//
//  StoreConfigurations.swift
//  WeatherApp
//
//  Created by apple on 10/3/23.
//

import Foundation

class ConfigManager: ObservableObject
{
    @Published var config: storeConfig = .remote
}


enum storeConfig {
 case remote , local
    
}


