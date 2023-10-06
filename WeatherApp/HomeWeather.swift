
//
//  ContentView.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//
import SwiftUI
import UIKit
struct ContentView: View {
    
    @State var searchText = ""
    @State var isFetchingWeather : Bool = false
    let configManager = ConfigManager()
    @State var model : WeatherModel?
    @State var coreModel : [WeatherModelEntity]?
    @StateObject var store = StoreManager.shared
    @State private var navigateToWeatherView = false
    init() {
        // Use this if NavigationBarTitle is with Large Font
               UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

               //Use this if NavigationBarTitle is with displayMode = .inline
               UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationView {
                VStack {
                    HStack(alignment: .center, spacing: -6.0) {
                        TextField("Search for city", text: $searchText)
                            .padding(10.0)
                            .background(.regularMaterial)
                                .cornerRadius(16)
                                .padding(.horizontal)
                                .submitLabel(.search)
                                .onSubmit{
                                    if !(searchText.isEmpty) {
                                        configManager.checkConnection()
                                        store.cityName = self.searchText
                                        store.getWeather()
                                        self.isFetchingWeather = store.isFetchingWeather
                                        searchText = ""
                                        navigateToWeatherView = true
                                    }
                                    
                                    else if searchText.isEmpty {
                                        configManager.checkConnection()
                                        LocalStore.shared.getWeatherData()
                                        self.isFetchingWeather = LocalStore.shared.isFetchingWeather
                                        
                                    }
                                }
                    }
                    if store.isFetchingWeather {
                        Spacer()
                        ProgressView()
                            .tint(.white)
                    } else {
                        
                        if let weather = store.weatherData {
                            NavigationLink("",destination: WeatherView(modelData: store.weatherData , selectedUnits: store.selectedUnit), isActive: $navigateToWeatherView)
                                .hidden()
                            
                            
                        }
                    }
                    Spacer()
                    
                    
//                    List(coreModel ?? [], id: \WeatherModelEntity.city?.id) { coreDataItem in
//                        WeatherCard(CoreData: coreDataItem)
//                    }
                    
                    
                    
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                    .background(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [Color.color, Color.grayish]
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
                        
                        Button {
                            store.selectedUnit = .imperial
                            
                                configManager.checkConnection()
                                store.getWeather()
                                self.isFetchingWeather = store.isFetchingWeather
                           

                        } label: {
                            HStack {
                                Text("Fahrenheit")
                                if store.selectedUnit.rawValue == "imperial"{
                                    Image(systemName: "checkmark.circle")
                                }
                            }
                        }
                        Button {
                            StoreManager.shared.selectedUnit = .metric
                            
                                configManager.checkConnection()
                                store.getWeather()
                                self.isFetchingWeather = store.isFetchingWeather
                            
                        } label: {
                            HStack {
                                Text("Celcius")
                                if store.selectedUnit.rawValue == "metric"{
                                    Image(systemName: "checkmark.circle")
                                }
                                
                            }
                        }

                    } label: {
                        Label("Menu", systemImage: "ellipsis.circle")
                                
                    }
                }
            }
        }
    }
    
}


struct WeatherCard: View {
    var CoreData: WeatherModelEntity?

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(CoreData?.city?.name ??  "")
                    .font(.title3)
                    .fontWeight(.semibold)
                let  currentTime = GetTime()
                Text(currentTime)
                    .font(.footnote)
                Spacer()
                if let firstList = CoreData?.list?.first as? List {
                    Text(firstList.weather?.description ?? "")
                        .font(.caption)
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                if let firstList = CoreData?.list?.first as? List {
                Text("\(Int(Double(firstList.main?.temp ?? "0") ?? 0))")
               
                    .font(.largeTitle)
                Spacer()
                
                    Text("H: \(Int(Double(firstList.main?.temp_max ?? "0") ?? 0))  L: \(Int(Double(firstList.main?.temp_min ?? "0") ?? 0))")
                        .font(.footnote)
                }
            }
        }.padding()
            .background(Color.teal)
            .cornerRadius(16)
            .frame(height: 100)
            .foregroundColor(.white)
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
