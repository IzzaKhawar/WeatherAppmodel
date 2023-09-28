//
//  ContentView.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewModel = WeatherAPIHandler()
//    @State var Data: [Model]
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            VStack {
                TextField("Search for city", text: $searchText)
                    .padding(.horizontal, 10.0)
                    .frame(maxWidth: .infinity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Data = $viewModel.fetchAPIData(searchText)
                ScrollView{
                    List {
                        ForEach($viewModel.FavCards, id: \.id) { card in
                            VStack {
                                WeatherCard()
                                Spacer()
                                
                            }
                        }
                    }.scrollContentBackground(.hidden)
                   
                }
                
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
struct WeatherCard:View{
    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(Color.accentColor)
                .padding(.horizontal, 5.0)
                .frame(height: 150.0)
                .cornerRadius(20.0)
            HStack{
                VStack(alignment: .leading){
                    Text("Lahore")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("3:38pm")
                        .font(.headline)
                    Spacer()
                        .frame(width: 0.0, height: 30.0)
                    Text("Mostly Sunny")
                        .font(.headline)
                }
                .foregroundColor(.white)
                
                VStack{
                    
                    Spacer()
                        .frame(width: 120.0, height: 150.0)
                }
                
                VStack(alignment: .trailing){
                    Text("37˚")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                        .frame(width: 0.0, height: 40)
                    Text("H:37˚ L:27˚")
                        .font(.headline)
                }
                .foregroundColor(.white)
                
                NavigationLink(destination: WeatherView()) {
                    Image(systemName: "chevron.forward")
                        .foregroundColor(Color.white)
                }
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
