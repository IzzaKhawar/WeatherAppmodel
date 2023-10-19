
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
    @EnvironmentObject var viewModel: HomeWeatherViewModel
    @EnvironmentObject var coordinator: WeatherCoordinator

    
    init() {}
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, spacing: -6.0) {
                    TextField("Search for city", text: $viewModel.searchText)
                        .autocorrectionDisabled(true)
                        .padding(10.0)
                        .background(.regularMaterial)
                        .cornerRadius(16)
                        .padding(.horizontal)
                        .submitLabel(.search)
                        .onSubmit{
                            viewModel.submit()
                             }
                    
                   
                }
                if viewModel.store.isFetchingWeather {
                    Spacer()
                    ProgressView()
                        .tint(.white)
                }
               
                
                else if let model =  viewModel.WeatherData{
                        
                    NavigationLink("",destination: WeatherView(modelData: model , selectedUnits: viewModel.store.selectedUnit), isActive: $viewModel.navigateToWeatherView)
                            .hidden()
                      
                }
            
                Spacer()
                
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
                            Button {
                                viewModel.setUnitToMetric()
                            }
                        label: {
                                HStack {
                                    Text("Celsius")
                                    if viewModel.Selection == .metric {
                                        Image(systemName: "checkmark.circle")
                                    }
                                }
                            }
                            Button {
                                viewModel.setUnitToImperial()
                            }
                        label: {
                            HStack {
                                Text("Fahrenheit")
                                if viewModel.Selection == .imperial {
                                    Image(systemName: "checkmark.circle")
                                }
                            }
                        }
                            
                            
                        } label: {
                            Label("Menu", systemImage: "ellipsis.circle")
                            
                        }
                    }
                }

                

                .navigationBarTitle("Weather", displayMode: .large)
            
            
            
        }
    }
   
}



#Preview {
    ContentView()
        .environmentObject(HomeWeatherViewModel())
        .environmentObject(WeatherCoordinator())
    
}

