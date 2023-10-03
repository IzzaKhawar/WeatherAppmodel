//
//  WeatherView.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//
import SwiftUI

struct WeatherView: View {
    var modelData: WeatherModel?
    
    var body: some View {
        VStack {
                if let model = modelData {
                    WeatherHeader(model: model)
                    
                    HourlyForecast(model: model)
                        
                     DailyForecast(model: model)
                
                    .background(Color.grayish)
                    .cornerRadius(15.0)
                    .padding()
                    
                    
                } else {
                    Text("Data Not Loaded")
                        .fontWeight(.bold)
                        .font(.headline)
                }
            
        }
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.color, Color.liner]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea([.top, .bottom])
        )
        .foregroundColor(.white)
    }
}

struct WeatherHeader: View {
    var model: WeatherModel

    var body: some View {
        VStack(alignment: .center) {
            Text(model.city?.name ?? "")
                .font(.system(size: 34))
                .fontWeight(.bold)

            Text("\(model.list?.first?.main?.temp ?? "0.0")°C")

            Text(model.list?.first?.weather?.first?.description ?? "")

            Text("H: \(model.list?.first?.main?.temp_max ?? "0.0")°C - L: \(model.list?.first?.main?.temp_min ?? "0.0")°C")
                .font(.headline)
        }
        
    }
}



struct DailyForecast: View {
    var model: WeatherModel

    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            Label("6-Days FORECAST", systemImage: "calendar")
                .font(.system(.subheadline, design: .rounded))
                .foregroundStyle(.secondary)
                .padding([.top, .leading], 10)
            
            Divider()
                .background(Color.primary)
                .padding([.leading, .trailing], 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    ForEach(model.dailyWeather, id: \.date) { dailyData in
                        DailyWeatherView(dailymodel: dailyData)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color.grayish)
        .cornerRadius(15.0)
        .padding()
    }
}


struct DailyWeatherView: View {
    var dailymodel: DailyWeather

    var body: some View {
        
                HStack {
                    Text("\(dailymodel.date)")
                        .font(.subheadline)

                    Spacer()
                        .frame(width: 30 , height: 35)
                    
                    Image(systemName: "\(dailymodel.weatherMain.description)".lowercased())
                        .foregroundColor(.white)
                    Spacer()
                        .frame(width: 30 , height: 35)
                   
                    Text("\(dailymodel.minTemperature )°C - \(dailymodel.maxTemperature  )°C")
                }
                Divider()
                    
        
    }
}


struct HourlyForecast: View {
    var model: WeatherModel

    var body: some View {
        VStack(alignment: .leading, spacing: nil) {
            
            Label("48-HOUR FORECAST", systemImage: "clock")
                .font(.system(.subheadline, design: .rounded))
                .foregroundStyle(.secondary)
                .padding([.top, .leading], 10)
            
            Divider()
                .background(Color.primary)
                .padding([.leading, .trailing], 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(model.hourlyWeather, id: \.timestamp) { hourlyData in
                        HourlyWeatherView(hourlyData: hourlyData)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color.grayish)
        .cornerRadius(15.0)
        .padding()
    }
}

struct HourlyWeatherView: View {
    var hourlyData: HourlyWeather

    var body: some View {
        VStack {
            Text(String(hourlyData.timestamp))
                .font(.caption)
                .foregroundColor(.white)
            Spacer()
                .frame(width: 15 , height: 25)

            Image(systemName: "\(hourlyData.weatherMain.description)".lowercased())
                .foregroundColor(.white)
            Spacer()
                .frame(width: 15 , height: 25)
            Text("\(hourlyData.temperature)°C")
        }
        .padding(.vertical)
        .frame(width: 80)
        
    }
}


#Preview {
    WeatherView()
}
