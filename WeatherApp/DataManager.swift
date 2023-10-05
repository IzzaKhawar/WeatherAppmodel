//
//  DataManager.swift
//  WeatherApp
//
//  Created by apple on 10/5/23.
//

import CoreData
import UIKit

open class DataManager: NSObject {
    public static let sharedInstance = DataManager()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private override init() {}

    private func getContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return appDelegate.persistentContainer.viewContext
    }

    func retrieveUser() -> NSManagedObject? {
        guard let managedContext = getContext() else { return nil }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")

        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            if result.count > 0 {
                return result[0]
            } else {
                return nil
            }
        } catch let error as NSError {
            print("Retrieving user failed. \(error): \(error.userInfo)")
            return nil
        }
    }

    func saveWeatherModelToCoreData(_ weatherModel: WeatherModel) -> Bool {
        let context = persistentContainer.viewContext  // Access the managed object context

        let weatherModelEntity = WeatherModelEntity(context: context)
        weatherModelEntity.cod = weatherModel.cod
        weatherModelEntity.message = Int16(weatherModel.message ?? 0)
        weatherModelEntity.cnt = Int16(weatherModel.cnt ?? 0)

        // Map City Entity
        if let city = weatherModel.city {
            let cityEntity = CityEntity(context: context)
            cityEntity.id = Int32(city.id ?? 0)
            cityEntity.name = city.name
            cityEntity.country = city.country
            cityEntity.population = Int32(city.population ?? 0)
            weatherModelEntity.city = cityEntity
        }

        // Map List Entities
        if let list = weatherModel.list {
            for listItem in list {
                let listEntity = ListEntity(context: context)
                listEntity.dt = Int32(listItem.dt ?? 0)
                listEntity.visibility = Int32(listItem.visibility ?? 0)
                listEntity.pop = listItem.pop ?? 0.0
                listEntity.dt_txt = listItem.dt_txt

                // Map Main Entity
                if let main = listItem.main {
                    let mainEntity = MainEntity(context: context)
                    mainEntity.temp = main.temp
                    mainEntity.feels_like = main.feels_like ?? 0.0
                    mainEntity.temp_min = main.temp_min
                    mainEntity.temp_max = main.temp_max
                    mainEntity.pressure = Int32(main.pressure ?? 0)
                    mainEntity.sea_level = Int32(main.sea_level ?? 0)
                    mainEntity.grnd_level = Int32(main.grnd_level ?? 0)
                    mainEntity.humidity = Int32(main.humidity ?? 0)
                    mainEntity.temp_kf = main.temp_kf ?? 0.0
                    listEntity.main = mainEntity
                }

                // Map Weather Entities
                if let weatherList = listItem.weather {
                    for weatherItem in weatherList {
                        let weatherEntity = WeatherEntity(context: context)
                        weatherEntity.id = Int32(weatherItem.id ?? 0)
                        weatherEntity.main = weatherItem.main
                        weatherEntity.desc = String(weatherItem.description ?? "")
                        weatherEntity.icon = weatherItem.icon
                        listEntity.addToWeather(weatherEntity)
                    }
                }

                // Map Clouds Entity
                if let clouds = listItem.clouds {
                    let cloudsEntity = CloudsEntity(context: context)
                    cloudsEntity.all = Int32(clouds.all ?? 0)
                    listEntity.clouds = cloudsEntity
                }

                // Map Wind Entity
                if let wind = listItem.wind {
                    let windEntity = WindEntity(context: context)
                    windEntity.speed = wind.speed ?? 0.0
                    windEntity.deg = Int32(wind.deg ?? 0)
                    windEntity.gust = wind.gust ?? 0.0
                    listEntity.wind = windEntity
                }

                // Map Sys Entity
                if let sys = listItem.sys {
                    let sysEntity = SysEntity(context: context)
                    sysEntity.pod = sys.pod
                    listEntity.sys = sysEntity
                }

                // Connect ListEntity to WeatherModelEntity
                listEntity.weatherModel = weatherModelEntity
            }
        }

        // Map HourlyWeather Entities
        for hourlyWeatherItem in weatherModel.hourlyWeather {
            let hourlyWeatherEntity = HourlyWeatherEntity(context: context)
            hourlyWeatherEntity.date = Int32(hourlyWeatherItem.date)
            hourlyWeatherEntity.timestamp = hourlyWeatherItem.timestamp
            hourlyWeatherEntity.temperature = hourlyWeatherItem.temperature
            hourlyWeatherEntity.weatherMain = hourlyWeatherItem.weatherMain
            hourlyWeatherEntity.weatherModel = weatherModelEntity
        }

        // Map DailyWeather Entities
        for dailyWeatherItem in weatherModel.dailyWeather {
            let dailyWeatherEntity = DailyWeatherEntity(context: context)
            dailyWeatherEntity.date = dailyWeatherItem.date
            dailyWeatherEntity.minTemperature = dailyWeatherItem.minTemperature
            dailyWeatherEntity.maxTemperature = dailyWeatherItem.maxTemperature
            dailyWeatherEntity.weatherMain = dailyWeatherItem.weatherMain
            dailyWeatherEntity.weatherModel = weatherModelEntity
        }

        do {
            try context.save()
            return true
        } catch {
            print("Failed to save weather data to Core Data: \(error)")
            return false
        }
    }
}

extension DataManager {
    func createUser() {
        guard let managedContext = getContext() else { return }
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        _ = NSManagedObject(entity: userEntity, insertInto: managedContext)

        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Failed to save new user! \(error): \(error.userInfo)")
        }
    }
}
