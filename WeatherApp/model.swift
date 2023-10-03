////
////  model.swift
////  WeatherApp
////
////  Created by apple on 10/3/23.
////
//
//import Foundation
//struct WeatherModel: Codable {
//    let coord: Coord?
//    let weather: [Weather]?
//    let base: String?
//    let main: Main?
//    let visibility: Int?
//    let wind: Wind?
//    let clouds: Clouds?
//    let dt: Int?
//    let sys: Sys?
//    let timezone: Int?
//    let id: Int?
//    let name: String?
//    let cod: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case coord = "coord"
//        case weather = "weather"
//        case base = "base"
//        case main = "main"
//        case visibility = "visibility"
//        case wind = "wind"
//        case clouds = "clouds"
//        case dt = "dt"
//        case sys = "sys"
//        case timezone = "timezone"
//        case id = "id"
//        case name = "name"
//        case cod = "cod"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        coord = try values.decodeIfPresent(Coord.self, forKey: .coord)
//        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
//        base = try values.decodeIfPresent(String.self, forKey: .base)
//        main = try values.decodeIfPresent(Main.self, forKey: .main)
//        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
//        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
//        clouds = try values.decodeIfPresent(Clouds.self, forKey: .clouds)
//        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
//        sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
//        timezone = try values.decodeIfPresent(Int.self, forKey: .timezone)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        cod = try values.decodeIfPresent(Int.self, forKey: .cod)
//
//    }
//}
//
////struct DailyForecast: Identifiable, Codable {
////    var id: Int // Change the id to an Int or another suitable identifier type
////
////    let date: Int
////    let temperature: Temperature
////    let weather: [Weather]
////
////    enum CodingKeys: String, CodingKey {
////        case id
////        case date = "dt"
////        case temperature = "temp"
////        case weather = "weather"
////    }
////
////    init(from decoder: Decoder) throws {
////        let container = try decoder.container(keyedBy: CodingKeys.self)
////
////        // Decode the 'id' from the 'dt' key and convert it to an Int
////        id = try container.decode(Int.self, forKey: .id)
////
////        date = try container.decode(Int.self, forKey: .date)
////        temperature = try container.decode(Temperature.self, forKey: .temperature)
////        weather = try container.decode([Weather].self, forKey: .weather)
////    }
////}
//
//struct Temperature: Codable {
//    let day: Double
//    let min: Double
//    let max: Double
//    let night: Double
//    let eve: Double
//    let morn: Double
//}
//
////struct HourlyForecastData: Identifiable , Codable {
////    var id = UUID()
////    var time: String
////    var weatherIcon: String
////    var temperature: String
////}
//
//struct Wind : Codable {
//    let speed : Double?
//    let deg : Int?
//
//}
//
//struct Weather : Codable{
//    let id : Int?
//    let main : String?
//    let description : String?
//    let icon : String?
//
//}
//
//struct Sys : Codable {
//    let type : Int?
//    let id : Int?
//    let country : String?
//    let sunrise : Int?
//    let sunset : Int?
//
//    
//}
//
//struct Main : Codable {
//    let temp : Double?
//    let feels_like : Double?
//    let temp_min : Double?
//    let temp_max : Double?
//    let pressure : Int?
//    let humidity : Int?
//
//    
//
//}
//
//struct Clouds : Codable {
//    let all : Int?
//
//    
//}
//
//struct Coord : Codable {
//    let lon : Double?
//    let lat : Double?
//
//    
//
//}
//
