
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
    @State private var FavWeather: [WeatherModelEntity] = DataManager.sharedInstance.fetchFavWeather()
    
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
                WeatherCard(CoreData: $FavWeather , UnitSelected : store.selectedUnit)
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
            
                .onAppear {
                    FavWeather = DataManager.sharedInstance.fetchFavWeather()
                    
                }
        }
    }
    
    
    
}


struct WeatherCard: View {
    @Binding var CoreData: [WeatherModelEntity]
    @State private var cardToDelete: WeatherModelEntity? = nil
    @State private var isDeleteButtonVisible = false 
    @State private var offset: CGSize = .zero

    @State  var UnitSelected : Units?
    var body: some View {
        ScrollView {
            ForEach(CoreData, id: \.id) { model in
                HStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(model.city?.name  ?? "")")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .opacity(cardToDelete == model ? 0.0 : 1.0)
                            if let list = model.list as? Set<ListEntity>, let firstListItem = list.first {
                                Spacer()
                                if let weather = firstListItem.weather as? Set<WeatherEntity>, let firstWeatherItem = weather.first {
                                    Text(firstWeatherItem.main ?? "")
                                        .font(.caption)
                                        .opacity(cardToDelete == model ? 0.0 : 1.0)
                                }
                            }
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            if let list = model.list as? Set<ListEntity>, !list.isEmpty {
                                let arrayFromSet = Array(list)
                                let middleIndex = (arrayFromSet.count / 2)+1
                                
                                if middleIndex < arrayFromSet.count {
                                    let middleItem = arrayFromSet[middleIndex]
                                    
                                    let middleTemp = Double(middleItem.main?.temp ?? "0") ?? 0.0
                                    let middleTempMax = Double(middleItem.main?.temp_max ?? "0") ?? 0.0
                                    let middleTempMin = Double(middleItem.main?.temp_min ?? "0") ?? 0.0
                                    
                                    Text("\(Int(middleTemp))\(UnitSelected == .metric ? "°C" : "°F")")
                                        .font(.largeTitle)
                                        .opacity(cardToDelete == model ? 0.0 : 1.0)
                                    Spacer()
                                    Text("H: \(Int(middleTempMax))\(UnitSelected == .metric ? "°C" : "°F")  L: \(Int(middleTempMin))\(UnitSelected == .metric ? "°C" : "°F")")
                                        .font(.footnote)
                                        .opacity(cardToDelete == model ? 0.0 : 1.0)
                                }
                            }


//                            if let list = model.list as? Set<ListEntity>, let firstListItem = list.first {
//                                Text("\(Int(Double(firstListItem.main?.temp ?? "0") ?? 0))")
//                                    .font(.largeTitle)
//                                    .opacity(cardToDelete == model ? 0.0 : 1.0)
//                                Spacer()
//                                Text("H: \(firstListItem.main?.temp_max ?? "0")  L: \(firstListItem.main?.temp_min ?? "0")")
//                                    .font(.footnote)
//                                    .opacity(cardToDelete == model ? 0.0 : 1.0)
//                            }
                        }
                    }
                    .padding()
                    .background(
                        ZStack {
                            Color.teal
                        }
                    )
                    .cornerRadius(16)
                    .frame(height: 100)
                    .foregroundColor(.white)
                    
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                                cardToDelete = model
                                isDeleteButtonVisible = true // Show delete button when sliding
                            }
                            .onEnded { _ in
                                offset = .zero
                                if let cardToDelete = cardToDelete, let index = CoreData.firstIndex(of: cardToDelete) {
                                    CoreData.remove(at: index)
                                    DataManager.sharedInstance.deleteDataModelFromCoreData(id: Int(cardToDelete.city?.id ?? 0))
                                }
                                cardToDelete = nil
                                isDeleteButtonVisible = false // Hide delete button after sliding
                            }
                    )
                    
                    if cardToDelete == model {
                        Button(action: {
                            if let id = model.city?.id {
                                DataManager.sharedInstance.deleteDataModelFromCoreData(id: Int(id))
                            }
                            CoreData.removeAll { entity in
                                entity == model
                            }
                            cardToDelete = nil
                            isDeleteButtonVisible = false // Hide delete button after clicking
                        }) {
                            Text("Delete")
                                .foregroundColor(.white)
                                .frame(height: 100)
                                .background(Color.red)
                                .cornerRadius(8)
                        }
                        .opacity(isDeleteButtonVisible ? 1.0 : 0.0) // Show delete button
                    }
                }
            }
        }
        .padding()
    }
}

    //    func GetTime() -> String{
    //        let currentDate = Date()
    //                let timeFormatter = DateFormatter()
    //                timeFormatter.dateFormat = "h:mm a"
    //                let currentTimeString = timeFormatter.string(from: currentDate)
    //
    //                return currentTimeString
    //    }
    
    
    
    
    
    
    
    #Preview {
        ContentView()
    }
