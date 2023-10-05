//
//  RemoteStore.swift
//  WeatherApp
//
//  Created by apple on 10/3/23.
//

import Foundation
import Alamofire
import SwiftUI

class RemoteStore: ObservableObject{
    
    static let shared = RemoteStore()
    
    @Published var isFetchingWeather: Bool = false
    @Published var weatherData: WeatherModel?
    @AppStorage("lastCity") var lastCity: String = ""
    
    internal init() { }
    
    func get(endPoint: String, parameters: Parameters?, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(
            Constants.shared.baseURL,
            method: .get,
            parameters: parameters,
            encoding: URLEncoding.default,
            headers: nil
        ).validate(statusCode: 200 ..< 299)
        .responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
