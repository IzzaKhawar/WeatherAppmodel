
//
//  ContentView.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//
import SwiftUI
import UIKit
struct ContentView: View {
    
    @State private var searchText = ""
    @ObservedObject var weatherAPIHandler = StoreManager()
    
    let configManager = ConfigManager()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, spacing: -6.0) {
                    TextField("Search for city", text: $searchText)
                        .padding(.horizontal, 10.0)
                        .frame(maxWidth: .infinity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    NavigationLink(destination: EmptyView()) {
                        Image(systemName: "arrow.forward.square.fill")
                            .resizable(capInsets: EdgeInsets(top: 15.0, leading: 15.0, bottom: 15.0, trailing: 15.0))
                            .foregroundColor(.gray)
                            .frame(width: 30.0, height: 30.0)
                            .onTapGesture {
                                if searchText.isEmpty {
                                    configManager.config = .local
                                    LocalStore.shared.getWeatherData()
                                } else {
                                    configManager.config = .remote
                                    RemoteStore.shared.cityName = searchText
                                    RemoteStore.shared.getWeatherByCityName()
                                    searchText = ""
                                }
                            }
//                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
                            .fixedSize(horizontal: true, vertical: true)
                    }
                }
                ScrollView{
                    
                    let model = weatherAPIHandler.getWeather()
                        WeatherCard(modelData: model)
                    
//                    else if RemoteStore.shared.isFetchingWeather {
//                        Text("Loading...")
//                    }
                }
            }
            .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [Color.color, Color.liner]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    ).ignoresSafeArea()
                )
           
            .navigationTitle("Weather")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Edit List", systemImage: "pencil") {}
                        Button("Fahrenheit") {}
                        Button("Celcius") {}
                    } label: {
                        Label("Menu", systemImage: "ellipsis.circle")
                                
                    }
                }
            }
        }
    }
    
}


struct WeatherCard: View {
    var modelData: WeatherModel?
    
    var body: some View {
        
            VStack {
                ZStack {
                    if let model = modelData {
                    Rectangle()
                        .fill(Color.liner)
                        .padding(.horizontal, 5.0)
                        .frame(height: 150.0)
                        .cornerRadius(40.0)
                    HStack {
                        
                            VStack(alignment: .leading) {
                                Text(model.city?.name ??  "")
                                    .font(.title)
                                    .fontWeight(.bold)
                              let  currentTime=GetTime()

                                Text(currentTime)
                                    .font(.headline)
                                Spacer()
                                    .frame(width: 0.0, height: 30.0)
                                Text(model.list?.first?.weather?.first?.description ?? "" )
                                    .font(.headline)
                            }
                            .padding(.leading)
                            .foregroundColor(.white)
                            
                            VStack {
                                Spacer()
                                    .frame(width: 120, height: 150.0)
                            }
                            
                            VStack(alignment: .trailing) {
                                Text("\(model.list?.first?.main?.temp ?? "0.0")°C")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                    .frame(width: 0.0, height: 20)
                                Text("H: \(model.list?.first?.main?.temp_max ?? "0.0" )°C")
                                    .font(.headline)
                                Text("L: \(model.list?.first?.main?.temp_min ?? "0.0")°C")
                                    .font(.headline)
                            }
                            .foregroundColor(.white)
                            .padding(.vertical)

                            NavigationLink(destination: WeatherView(modelData: modelData)) {
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(Color.white)
                            }
                        
                        
                }
                    }
                    
                    else {
                        Text("Loading...")
                            .foregroundColor(.white)
                    }
            }

        }
    }
    func GetTime() -> String{
        let currentDate = Date()
                let timeFormatter = DateFormatter()
                timeFormatter.dateFormat = "h:mm a"
                let currentTimeString = timeFormatter.string(from: currentDate)

                return currentTimeString
    }
    
}
#Preview {
    ContentView()
}
