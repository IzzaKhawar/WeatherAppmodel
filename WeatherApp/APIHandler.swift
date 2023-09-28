//
//  File.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//

import Foundation
import Alamofire
import UIKit

class WeatherAPIHandler: ObservableObject{
    static let sharedInstance = WeatherAPIHandler()
    @Published var FavCards: [Model] = []
    let apiKey = "6acddb15f75e1b20657b4d33428d759c"
    init() {
        self.fetchAPIData()
    }
    
    func fetchAPIData(){
        let city = "lahore"
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)";
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .responseString { response in
                switch response.result {
                case .success(let jsonString):
                    print(jsonString)
                       
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
    }
   
}
struct Model:Codable{
    let id : Double
    let name: String
    let country : String
    let timezone: Double
    let temp : Double
    let temp_max: Double
    let temp_min: Double
    let main: String
    let description: String
    let icon : String
}
