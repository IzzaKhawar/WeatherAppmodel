
//
//  ContentView.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//

import SwiftUI


struct ContentView: View {
    
    @State private var searchText = ""
    @StateObject var weatherAPIHandler = WeatherAPIHandler()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search for city", text: $searchText)
                    .padding(.horizontal, 10.0)
                    .frame(maxWidth: .infinity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                ScrollView {
                        WeatherCard(modelData: weatherAPIHandler.modelData)
                    
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Weather")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Edit List", systemImage: "pencil") {}
                        Button("Fahrenheit") {}
                        Button("Celcius") {}
                    } label: {
                        Label("Menu", systemImage: "ellipsis.circle")
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }
    }
}


struct WeatherCard: View {
    var modelData: Model?

    var body: some View {
        
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.accentColor)
                        .padding(.horizontal, 5.0)
                        .frame(height: 150.0)
                        .cornerRadius(20.0)
                    HStack {
                        if let model = modelData {
                            VStack(alignment: .leading) {
                                Text(model.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                              let  currentTime=GetTime()

                                Text(currentTime)
                                    .font(.headline)
                                Spacer()
                                    .frame(width: 0.0, height: 30.0)
                                Text(model.description)
                                    .font(.headline)
                            }
                            .padding(.leading)
                            .foregroundColor(.white)
                            
                            VStack {
                                Spacer()
                                    .frame(width: 120, height: 150.0)
                            }
                            
                            VStack(alignment: .trailing) {
                                Text("\(model.temp)˚K")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                    .frame(width: 0.0, height: 20)
                                Text("H: \(model.temp_max)˚K")
                                    .font(.headline)
                                Text("L: \(model.temp_min)˚K")
                                    .font(.headline)
                            }
                            .foregroundColor(.white)
                            .padding(.vertical)

                            NavigationLink(destination: WeatherView(modelData: model)) {
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(Color.white)
                            }
                        }
                        
                        else {
                            Text("Loading...")
                                .foregroundColor(.white)
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
#Preview {
    ContentView()
}
