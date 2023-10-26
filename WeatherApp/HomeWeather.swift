
//
//  ContentView.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//
import SwiftUI
import UIKit
import CoreData

struct ContentView: View {
    
    @State var searchText = ""
    @State var isFetchingWeather : Bool = false
    let configManager = ConfigManager()
    //    @State var model : WeatherModel?
    @StateObject var store = StoreManager.shared
    @State private var favWeather: [FavWeather] = DataManager.sharedInstance.fetchFavWeather()
    @State private var DATAMODEL: [WeatherModel] = []
    @State private var navigateToWeatherView = false
    @State private var Selection : Units = .metric
    @State private var isEditing = false
    
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
                                store.getWeather(success: { weatherData in
                                    // Handle successful response with weatherData
                                }, failure: { error in
                                    
                                    print(error)
                                })
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
                ScrollView{
                    ForEach(DATAMODEL, id: \.city?.id ) { model in
                        WeatherCard(CoreData: [model], UnitSelected: store.selectedUnit)
                        
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
                            colors: [Color.black, Color.black]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    ).ignoresSafeArea()
                )
            
                .navigationTitle("Weather")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
//                            Button("Edit List", systemImage: isEditing ? "pencil.circle.fill" : "pencil") {
//                                isEditing.toggle() // Toggle the editing mode
//                            }
                            
                            
                            Button {
                                store.selectedUnit = .imperial
                                Selection = .imperial
                                configManager.checkConnection()
                                store.getWeather(success: { weatherData in
                                    // Handle successful response with weatherData
                                }, failure: { error in
                                    print(error)
                                })
                                self.isFetchingWeather = store.isFetchingWeather
                                getData()
                                
                            } label: {
                                HStack {
                                    Text("Fahrenheit")
                                    if store.selectedUnit.rawValue == "imperial"{
                                        
                                        Image(systemName: "checkmark.circle")
                                    }
                                }
                            }
                            Button {
                                store.selectedUnit = .metric
                                Selection = .metric
                                configManager.checkConnection()
                                store.getWeather(success: { weatherData in
                                    // Handle successful response with weatherData
                                }, failure: { error in
                                    print(error)
                                })
                                self.isFetchingWeather = store.isFetchingWeather
                                getData()
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
                .onAppear(perform: getData )
                .navigationBarTitle("Weather", displayMode: .large)
            
            
            
        }
    }
  
    private func getData() {
        DATAMODEL.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
            
            favWeather = DataManager.sharedInstance.fetchFavWeather()
            
            for fav in favWeather {
                if let cityName = fav.city {
                    store.cityName = cityName
                    self.isFetchingWeather = store.isFetchingWeather
                    store.selectedUnit = Selection
                    store.getWeather(success: { weatherData in
                        let modelData =  weatherData
                        DATAMODEL.append(modelData)
                    },
                                     failure: { error in
                        print("Failed to fetch weather data for city: \(cityName)\(error)")
                    })
                    
                }
            }
        }
    }
    
}



struct WeatherCard: View {
    @State var CoreData: [WeatherModel]
    
    @StateObject var store = StoreManager.shared
    @State  var UnitSelected: Units?
    let configManager = ConfigManager()
    @State private var offset: CGSize = .zero
    @State private var navigateToWeatherView = false
    @State private var cardToDelete: String? = nil
    @State var isDeleteButtonVisible :Bool = false
    @State private var isDeleted = false
    
    var body: some View {
        
        ForEach(CoreData, id: \.city?.id) { model in
            HStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(model.city?.name ?? "")
                            .font(.title3)
                            .fontWeight(.semibold)
                        let currentTime = GetTime()
                        Text(currentTime)
                            .font(.footnote)
                        Spacer()
                        Text(model.list?.first?.weather?.first?.description ?? "")
                            .font(.caption)
                        
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("\(Int(Double(model.list?.first?.main?.temp ?? "0") ?? 0))\(UnitSelected == .metric ? "°C" : "°F")")
                            .font(.largeTitle)
                        Spacer()
                        Text("H: \(Int(Double(model.list?.first?.main?.temp_max ?? "0") ?? 0))\(UnitSelected == .metric ? "°C" : "°F")  L: \(Int(Double(model.list?.first?.main?.temp_min ?? "0") ?? 0))\(UnitSelected == .metric ? "°C" : "°F")")
                            .font(.footnote)
                        
                    }
                    
                    
                    Image(systemName: "chevron.forward")
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            navigateToWeatherView = true
                        }
                    NavigationLink("" , destination:  WeatherView(modelData: model, selectedUnits: UnitSelected), isActive: $navigateToWeatherView)
                    
                }
                
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [Color.color, Color.gray]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    ).ignoresSafeArea()
                )
                .cornerRadius(16)
                .frame(height: 100)
                
                .foregroundColor(.white)
                
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            offset = gesture.translation
                            cardToDelete = model.city?.name
                            if gesture.translation.width < 0 {
                                // Swiping from right to left
                                isDeleteButtonVisible = true // Show delete button
                            } else {
                                withAnimation {
                                    isDeleteButtonVisible = false
                                    cardToDelete = nil
                                    offset = .zero
                                }
                            }
                        }
                        .onEnded { gesture in
                            offset = .zero
                            if isDeleted {
                                if let cardToDelete = cardToDelete, let index = CoreData.firstIndex(where: { $0.city?.name == cardToDelete }) {
                                    CoreData.remove(at: index)
                                    let cityname = cardToDelete
                                    isDeleted = DataManager.sharedInstance.deleteFavWeather(name: cityname)
                                }
                                cardToDelete = nil
                                isDeleteButtonVisible = false
                            }
                        }
                )
                if cardToDelete == model.city?.name {
                    Button(action: {
                        if let cityname = model.city?.name {
                            isDeleted = DataManager.sharedInstance.deleteFavWeather(name: cityname)
                        }
                        CoreData.removeAll { entity in
                            entity.city?.name == model.city?.name
                        }
                        cardToDelete = nil
                        isDeleteButtonVisible = false
                    }) {
                        Text("Delete")
                            .foregroundColor(.white)
                            .frame(width : 60,height: 100)
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                    .scaleEffect(isDeleteButtonVisible ? 1.0 : 0.0)
                }
            }
        }
        .padding(.horizontal)
    }
    
    func GetTime() -> String {
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

