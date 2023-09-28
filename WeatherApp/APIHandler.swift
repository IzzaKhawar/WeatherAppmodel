//
//  File.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//

import Foundation
import Alamofire

class WeatherAPIHandler: ObservableObject {
    static let sharedInstance = WeatherAPIHandler()
    
    @Published var modelData = Model(weatherID: 0.0, name: "", country: "", timezone: 0.0, temp: "0.0", temp_max: "0.0", temp_min: "0.0", main: "", description: "", icon: "")
    
    let apiKey = "6acddb15f75e1b20657b4d33428d759c"
    
    init() {
        self.fetchAPIData { _ in
            // Do something after fetching data if needed
        }
    }
    
    func fetchAPIData(completion: @escaping (Model?) -> Void) {
        let city = "lahore"
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .responseString { response in
                switch response.result {
                    case .success(let jsonString):
                        self.dataHandler(data: jsonString, completion: completion)
                    case .failure(let error):
                        print(error.localizedDescription)
                        completion(nil) // Handle the error case
                }
            }
    }
    
    func dataHandler(data: String, completion: @escaping (Model?) -> Void) {
        if let jsonData = data.data(using: .utf8) {
            do {
                // Parse the JSON data
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                    // Extract the values
                    if let weatherArray = json["weather"] as? [[String: Any]], let weather = weatherArray.first {
                        if let weatherID = weather["id"] as? Double,
                           let weatherMain = weather["main"] as? String,
                           let weatherDescription = weather["description"] as? String,
                           let weatherIcon = weather["icon"] as? String,
                           let main = json["main"] as? [String: Any],
                           let mainTemp = main["temp"] as? Double,
                           let mainTempMax = main["temp_max"] as? Double,
                           let mainTempMin = main["temp_min"] as? Double,
                           let name = json["name"] as? String,
                           let sys = json["sys"] as? [String: Any],
                           let country = sys["country"] as? String,
                           let timezone = json["timezone"] as? Double {
                            
                            let formatter = NumberFormatter()
                            formatter.minimumFractionDigits = 2
                            formatter.maximumFractionDigits = 2
                            
                            let formattedMainTemp = formatter.string(from: NSNumber(value: mainTemp)) ?? "0.00"
                            let formattedMainTempMax = formatter.string(from: NSNumber(value: mainTempMax)) ?? "0.00"
                            let formattedMainTempMin = formatter.string(from: NSNumber(value: mainTempMin)) ?? "0.00"
                            
                            // Populate the modelData instance
                            self.modelData = Model(weatherID: weatherID, name: name, country: country, timezone: timezone, temp: formattedMainTemp, temp_max: formattedMainTempMax, temp_min: formattedMainTempMin, main: weatherMain, description: weatherDescription, icon: weatherIcon)
                            
                            
                            // Call the completion handler with the populated data
                            completion(self.modelData)
                        }
                    }
                }
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
                completion(nil) // Handle the parsing error case
            }
        }
    }
}


struct Model: Codable {
    let weatherID: Double
    let name: String
    let country: String
    let timezone: Double
    let temp: String
    let temp_max: String
    let temp_min: String
    let main: String
    let description: String
    let icon: String
}
