//
//  WeatherView.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//
import SwiftUI
struct WeatherView: View {
    @ObservedObject var viewModel: DetailedWeatherViewModel
   
    var body: some View {
        NavigationView{
            
            VStack (spacing: -4){
                if let model = viewModel.modelData, let unitSelected = viewModel.selectedUnits {
                    
                    WeatherHeader(viewModel: DetailedWeatherViewModel(modelData: model, selectedUnits: unitSelected))
                    HourlyForecast(viewModel: HourlyForecastViewModel(model: model, selectedUnits: unitSelected))
                    DailyForecast(viewModel: DailyForecastViewModel(model: model, selectedUnits: unitSelected))

                } else {
                    Text("Data Not Loaded")
                        .fontWeight(.bold)
                        .font(.headline)
                }
                
            }
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.color, Color.gray]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea([.top, .bottom])
            )
            .foregroundColor(.white)
            
            
            
        }
         
        }
    
    
    
}

struct WeatherHeader: View {
    @ObservedObject var viewModel: DetailedWeatherViewModel

    var body: some View {
        VStack(alignment: .center) {
            Text(viewModel.modelData?.city?.name ?? "")
                .font(.system(size: 30))
                .fontWeight(.semibold)
            
            Text("\(viewModel.modelData?.list?.first?.main?.temp ?? "0")°")
                .font(.system(size: 102))
            
            Text(viewModel.modelData?.list?.first?.weather?.first?.main ?? "")
                .font(.title3)
            
            Text("H: \(Int(Double(viewModel.modelData?.list?.first?.main?.temp_max ?? "0") ?? 0))\(viewModel.select)   L: \(Int(Double(viewModel.modelData?.list?.first?.main?.temp_min ?? "0") ?? 0))\(viewModel.select)")
                .font(.footnote)
        }
        
    }
}



struct DailyForecast: View {
    @ObservedObject var viewModel: DailyForecastViewModel
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
                    ForEach(viewModel.model.dailyWeather, id: \.date) { dailyData in
                        
                        DailyWeatherView(viewModel: DailyWeatherViewModel(dailyData: dailyData, selectedUnits: viewModel.selectedUnits))
                        Divider()
                            .background(Color.primary)
                            .padding([.leading, .trailing], 10)
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
    @ObservedObject var viewModel: DailyWeatherViewModel

    var body: some View {
        
        HStack {
            Text("\(viewModel.dailymodel.date)")
                .font(.subheadline)
            
            Spacer()
                .frame(width: 30 , height: 35)
            
            Image(systemName: "\(viewModel.dailymodel.weatherMain)".lowercased())
                .foregroundColor(.white)
            Spacer()
                .frame(width: 30 , height: 35)
            
            Text("\(viewModel.dailymodel.minTemperature )\(viewModel.select) - \(viewModel.dailymodel.maxTemperature  )\(viewModel.select)" )
        }
                
        
    }
}


struct HourlyForecast: View {
    @ObservedObject var viewModel: HourlyForecastViewModel
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
                    ForEach(viewModel.model.hourlyWeather, id: \.timestamp) { hourlyData in
                        HourlyWeatherView(viewModel: HourlyWeatherViewModel(hourlyData: hourlyData, selectedUnits: viewModel.selectedUnits))
                        
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
    @ObservedObject var viewModel: HourlyWeatherViewModel
    
    var body: some View {
        VStack {
            Text(String(viewModel.hourlyData.timestamp))
                .font(.caption)
                .foregroundColor(.white)
            Spacer()
                .frame(width: 15 , height: 25)
            
            Image(systemName: "\(viewModel.hourlyData.weatherMain)".lowercased())
                .foregroundColor(.white)
            Spacer()
                .frame(width: 15 , height: 25)
            Text("\(viewModel.hourlyData.temperature)\(viewModel.select)")
        }
        .padding(.vertical)
        .frame(width: 80)
        
    }
}



