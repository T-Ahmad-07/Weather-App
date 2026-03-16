 //
//  ContentView.swift
//  Weather App
//
//  Created by Tanzeal Ahmad on 24/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var body: some View {
        ZStack() {
            
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack() {
            
                CityNameView(cityName: "Morden")
                
                CurrentView(weatherImage: isNight ? "moon.fill" : "sun.max.fill", temperature: isNight ? 10 : 24)
               
                Spacer()
                HStack(spacing: 3) {
                    WeatherView(dayOfWeek: "TUE",
                                weatherIcon: "cloud.sun.fill",
                                temperature: 10)
                    
                    WeatherView(dayOfWeek: "WED",
                                weatherIcon: "cloud.heavyrain.fill",
                                temperature: 5)
                    
                    WeatherView(dayOfWeek: "THU",
                                weatherIcon: "snow",
                                temperature: -4)
                    
                    WeatherView(dayOfWeek: "FRI",
                                weatherIcon: "wind",
                                temperature: 9)
                    
                    WeatherView(dayOfWeek: "SAT",
                                weatherIcon: "sun.max.fill",
                                temperature: 25)
                 
                    
                }
            
                Spacer()
                
                Button (action: {
                    isNight.toggle()
                }, label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(isNight ? .white : .blue)
                        .background(isNight ? Color.blue : Color.white)
                        .cornerRadius(15)
                })
            }
            
        }
    }
}

struct WeatherView: View {
    var dayOfWeek: String
    var weatherIcon: String
    var temperature: Int
    var body: some View {
        VStack {
            Text("\(dayOfWeek)")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium))
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityNameView: View {
    var cityName: String
    var body: some View {
        Text("\(cityName)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}

struct CurrentView: View {
    
    var weatherImage: String
    var temperature: Int
    var body: some View {
        
        VStack(spacing: 6) {
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

