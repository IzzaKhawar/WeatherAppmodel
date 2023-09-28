//
//  WeatherView.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//

import SwiftUI

struct WeatherView: View {
    var modelData: Model?
    var body: some View {
        VStack{
            if let model = modelData {
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content:{
                    Text(model.name)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Text(model.temp)
                        .font(.system(size: 54))
                        .fontWeight(.regular)
                    Text(model.main)
                        .font(.title2)
                    Text("H:\(model.temp_max) L:\(model.temp_min)")
                        .font(.title2)
                })
                
                VStack(alignment:.leading ,content: {
                    Form{
                        
                        Text(model.description)
                            .padding([.top, .leading, .trailing])
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Divider()
                            .background(Color.white)
                            .bold()
                        ScrollView(.horizontal) {
                            HStack {
                                VStack{
                                    Text("6 PM")
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Text(model.temp)
                                }
                                .padding(.all)
                                VStack{
                                    Text("7 PM")
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Text(model.temp)
                                }
                                .padding(.all)
                                VStack{
                                    Text("8 PM")
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Text(model.temp)
                                }
                                .padding(.all)
                                VStack{
                                    Text("9 PM")
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Text(model.temp)
                                }
                                .padding(.all)
                                VStack{
                                    Text("4 PM")
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Text(model.temp)
                                }
                                .padding(.all)
                                
                            }
                            
                            
                        }
                        
                    }
                    .background(Color(hue: 0.989, saturation: 0.035, brightness: 0.277, opacity: 0.368))
                    .formStyle(.columns)
                    .scrollContentBackground(.hidden)
                    .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                    
                })
                .padding()
                
                
                VStack(alignment: .leading ,content: {
                    Form{
                        
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(Color("Gray")) // Set the image color if desired
                            Text("10-Day Forecast")
                                .font(.headline)
                                .foregroundColor(Color("Gray"))
                            
                        }
                        .padding([.top, .leading, .trailing])
                        .font(.subheadline)
                        
                        Divider()
                            .background(Color.white)
                            .bold()
                        ScrollView(.vertical) {
                            VStack {
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 35.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 20.0, height: 4.0)
                                    Text(model.temp_min)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 50.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Text(model.temp_max)
                                }
                                .padding()
                                Divider()
                                    .background(Color.white)
                                
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 35.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 20.0, height: 4.0)
                                    Text(model.temp_min)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 50.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Text(model.temp_max)
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 35.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 20.0, height: 4.0)
                                    Text(model.temp_min)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 50.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Text(model.temp_max)
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 35.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 20.0, height: 4.0)
                                    Text(model.temp_min)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 50.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Text(model.temp_max)
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 35.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 20.0, height: 4.0)
                                    Text(model.temp_min)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 50.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Text(model.temp_max)
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 35.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 20.0, height: 4.0)
                                    Text(model.temp_min)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 50.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Text(model.temp_max)
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 35.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 20.0, height: 4.0)
                                    Text(model.temp_min)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 50.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Text(model.temp_max)
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 35.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 20.0, height: 4.0)
                                    Text(model.temp_min)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 50.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Text(model.temp_max)
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 35.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 20.0, height: 4.0)
                                    Text(model.temp_min)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 50.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Text(model.temp_max)
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 35.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 20.0, height: 4.0)
                                    Text(model.temp_min)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 50.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 10.0, height: 4.0)
                                    Text(model.temp_max)
                                }
                                .padding()
                            }
                            
                        }
                        .foregroundColor(.white)
                    }
                    .background(Color(hue: 0.989, saturation: 0.035, brightness: 0.277, opacity: 0.338))
                    .formStyle(.columns)
                    .scrollContentBackground(.hidden)
                    .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                    
                })
                .padding([.top, .leading, .trailing])
                
                
            }
            else{
                Text("Data Not Loaded")
            }
        }
                .background(LinearGradient(
                    colors: [Color.liner, Color.accent],
                    startPoint: .top,
                    endPoint: .bottom
                )
                    .edgesIgnoringSafeArea([.top, .bottom]))
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
    WeatherView()
}
