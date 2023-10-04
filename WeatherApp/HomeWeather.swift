
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
    @State var isFetchingWeather : Bool = false
    let configManager = ConfigManager()
    @State var model : WeatherModel?
    @State private var navigateToWeatherView = false
    var body: some View {
        NavigationView {
            ScrollView{
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
                                    if !(searchText.isEmpty) {
                                        configManager.checkConnection()
                                        RemoteStore.shared.cityName = self.searchText
                                        RemoteStore.shared.getWeatherByCityName()
                                        self.isFetchingWeather = RemoteStore.shared.isFetchingWeather
                                        searchText = ""                                    }
                                    
                                    else if searchText.isEmpty {
                                        configManager.checkConnection()
                                        LocalStore.shared.getWeatherData()
                                        self.isFetchingWeather = LocalStore.shared.isFetchingWeather
                                        
                                    }
                                    self.model = StoreManager.shared.getWeather()
                                    if model != nil {
                                                        navigateToWeatherView = true
                                                    }
                                }
                        }
                        //                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .fixedSize(horizontal: true, vertical: true)
                    }
                    if let model = model {
                        
                        NavigationLink("", destination: WeatherView(modelData: model), isActive: $navigateToWeatherView)
                                                .hidden()
                        
                    }
                   
//                    else {
//                        let model1 = RemoteStore.shared.getWeatherByCityName()
//                        WeatherCard(modelData: model1)
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
    @State private var animationProgress: Double = 0.0
    var body: some View {
        
            VStack {
                if let model = modelData {
                ZStack {
                    
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
                }
                
                else {
                    Image(systemName: "slowmo")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .modifier(CustomAnimationModifier(animatableData: animationProgress))
                                    .onAppear() {
                                        withAnimation(
                                            Animation
                                                .linear(duration: 2.0)
                                                .repeatForever(autoreverses: true)
                                                .delay(0.5)
                                        ) {
                                            animationProgress = 1.0
                                        }
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
