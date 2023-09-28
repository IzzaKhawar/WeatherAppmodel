//
//  WeatherView.swift
//  WeatherApp
//
//  Created by apple on 9/27/23.
//

import SwiftUI

struct WeatherView: View {
   
    var body: some View {
            VStack{
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content:{
                    Text("Lahore")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Text("37˚")
                        .font(.system(size: 110))
                        .fontWeight(.regular)
                    Text("Mostly Sunny")
                        .font(.title2)
                    Text("H:37˚ L:27˚")
                        .font(.title2)
                })
                
                VStack(alignment:.leading ,content: {
                    Form{
                        
                        Text("Sunny conditions will continue for the rest of the day")
                            .padding([.top, .leading, .trailing])
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Divider()
                            .background(Color.white)
                            .bold()
                            .padding()
                        ScrollView(.horizontal) {
                            HStack {
                                VStack{
                                    Text("4 PM")
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Text("37˚")
                                }
                                .padding(.all)
                                VStack{
                                    Text("4 PM")
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Text("37˚")
                                }
                                .padding(.all)
                                VStack{
                                    Text("4 PM")
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Text("37˚")
                                }
                                .padding(.all)
                                VStack{
                                    Text("4 PM")
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Text("37˚")
                                }
                                .padding(.all)
                                VStack{
                                    Text("4 PM")
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Text("37˚")
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
                                        .frame(width: 45.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Text("37˚")
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 80.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Text("37˚")
                                }
                                .padding()
                                Divider()
                                    .background(Color.white)
                                
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Text("37˚")
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 80.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Text("37˚")
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Text("37˚")
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 80.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Text("37˚")
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Text("37˚")
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 80.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Text("37˚")
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Text("37˚")
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 80.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Text("37˚")
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Text("37˚")
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 80.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Text("37˚")
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Text("37˚")
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 80.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Text("37˚")
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Text("37˚")
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 80.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Text("37˚")
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Text("37˚")
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 80.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Text("37˚")
                                }
                                .padding()
                                Divider()
                                    .background(Color.liner)
                                HStack{
                                    Text("Today")
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Image(systemName:"sun.max.fill")
                                        .foregroundColor(.yellow)
                                    Spacer()
                                        .frame(width: 45.0, height: 4.0)
                                    Text("37˚")
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Rectangle()
                                        .fill(Color.orange)
                                        .frame(width: 80.0, height: 4.0)
                                        .cornerRadius(5)
                                    Spacer()
                                        .frame(width: 15.0, height: 4.0)
                                    Text("37˚")
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
            .background(LinearGradient(
                colors: [Color.liner, Color.accent],
                startPoint: .top,
                endPoint: .bottom
             )
             .edgesIgnoringSafeArea([.top, .bottom]))
            .foregroundColor(.white)
            
    }
}

#Preview {
    WeatherView()
}
