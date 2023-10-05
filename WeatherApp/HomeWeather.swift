
//
//  ContentView.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//
import SwiftUI
import UIKit
import Alamofire

struct ContentView: View {
    
    @State private var searchText = ""
    @State var isFetchingWeather : Bool = false
    let configManager = ConfigManager()
    @State var model : WeatherModel?
    @State private var navigateToWeatherView = false
    
    @StateObject var viewModel = ViewModel()
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
                        TextField("Search for city", text: $viewModel.searchText)
                            .padding(10.0)
                            .background(.regularMaterial)
                                .cornerRadius(16)
                                .padding(.horizontal)
                                .submitLabel(.search)
                                .onSubmit {
                                    if !viewModel.searchText.isEmpty {
                                        viewModel.getWeather()
                                    }
                                    else if viewModel.searchText.isEmpty{
//                                        LocalStore.shared.getWeatherData()
                                    }
                                }
                    }
                    if viewModel.isFetchingWeather {
                        Spacer()
                        ProgressView()
                            .tint(.white)
                    } else {
                        
                        if let weather = viewModel.fetchedWeatherData {
                            NavigationLink(destination: WeatherView(modelData: viewModel.fetchedWeatherData)) {
                                WeatherCard(modelData: weather, selectedUnit: viewModel.selectedUnit)
                            }
                                .padding(.horizontal)
                            
                        }
                    }
                    Spacer()
                    
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .background(
                Color.black
                )
           
            .navigationTitle("Weather")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Edit List", systemImage: "pencil") {}
                        Button {
                            viewModel.selectedUnit = .metric
                            if !viewModel.searchText.isEmpty {
                                viewModel.getWeather()
                            }
                        } label: {
                            HStack {

                                Text("Celcius") // (°C)
                                if viewModel.selectedUnit == .metric {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        Button {
                            viewModel.selectedUnit = .imperial
                            if !viewModel.searchText.isEmpty {
                                viewModel.getWeather()
                            }
                        } label: {
                            HStack {

                                Text("Fahrenheit") //(°F)
                                if viewModel.selectedUnit == .imperial {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
    
}

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var searchText = ""
        @Published var isFetchingWeather = false
        @Published var fetchedWeatherData: WeatherModel?
        @AppStorage ("selected-unit") var selectedUnit = Units.metric
        func getWeather() {
                self.isFetchingWeather = true
                let params: Parameters = [
                    "q":  self.searchText,
                    "appid": Constants.shared.API_Key,
                    "units": self.selectedUnit.rawValue
                ]
                
            APIManager.shared.getWeatherByCityName(params: params) { response in
                self.fetchedWeatherData = response
                self.isFetchingWeather = false
                self.searchText = ""
            } failure: { error in
                print(error)
            }

               
        }
    }
}


enum Units: String {
    case metric = "metric"
    case imperial = "imperial"
    case standard = "standard"
}

struct WeatherCard: View {
    var modelData: WeatherModel?
    let selectedUnit: Units
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(modelData?.city?.name ??  "")
                    .font(.title3)
                    .fontWeight(.semibold)
                let  currentTime = GetTime()
                Text(currentTime)
                    .font(.footnote)
                Spacer()
                Text(modelData?.list?.first?.weather?.first?.description ?? "" )
                    .font(.caption)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(Int(Double(modelData?.list?.first?.main?.temp ?? "0") ?? 0))\(selectedUnit == .metric ? "°C" : "°F")")
               
                    .font(.largeTitle)
                Spacer()
                Text("H: \(Int(Double(modelData?.list?.first?.main?.temp_max ?? "0") ?? 0))\(selectedUnit == .metric ? "°C" : "°F")  L: \(Int(Double(modelData?.list?.first?.main?.temp_min ?? "0") ?? 0))\(selectedUnit == .metric ? "°C" : "°F")")
                    .font(.footnote)
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

struct CustomAnimationModifier: AnimatableModifier {
    var animatableData: Double

    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.grayish)
            .opacity(animatableData)
    }
}
#Preview {
    ContentView()
}
