
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
               
                else if viewModel.WeatherData != nil {
                        
                    NavigationLink("",destination: WeatherView(modelData: viewModel.WeatherData , selectedUnits: viewModel.store.selectedUnit), isActive: $viewModel.navigateToWeatherView)
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
//                            ContentView.FahrenheitButton
//                            ContentView.CelciusButton
                            
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

