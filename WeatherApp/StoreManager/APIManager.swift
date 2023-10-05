//
//  APIManager.swift
//  WeatherApp
//
//  Created by mahad on 05/10/2023.
//

import Foundation
import Alamofire

class APIManager: ObservableObject {
    static let shared = APIManager() // Singleton instance
    
    private init() {}
    
    func getWeatherByCityName(params: Parameters, success: @escaping (WeatherModel) -> Void, failure: @escaping (Error) -> Void) {
        RemoteStore.shared.get( endPoint: Constants.shared.baseURL, parameters: params) { response in
            switch response {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let weather = try decoder.decode(WeatherModel.self, from: data)
                    success(weather)
                } catch {
                    failure(error)
                }
                
            case .failure(let error):
                failure(error)
            }
        }
    }
}
