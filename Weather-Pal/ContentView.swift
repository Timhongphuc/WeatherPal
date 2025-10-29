//
//  ContentView.swift
//  Weather-Pal
//
//  Created by Tim Seufert on 30.07.25.
//

import SwiftUI
import FoundationModels
import Playgrounds
import Foundation

struct ContentView: View {
    @State private var temperature: Double = 0
    @State private var tempMax: Double = 0
    @State private var tempMin: Double = 0
    @State private var description: String = ""
    @State private var pressure: Int = 0
    @State private var wind: Double = 0
    @State private var sunrise: String = ""
    @State private var sunset: String = ""
    
    @State private var ai: [AI_Weather_AppTests] = []
    //DESIGN
    @State var wIconDesign: Bool = false
    @State var dayTime: Bool = true
    //FUNCTIONS
    func loadData() {
        Task {
            do {
                print("Data is on it's way! 🚀")
                
                let weatherResponse = try await fetchWeatherData() //Function Call in ContentView
                
                temperature = weatherResponse.main.temp
                tempMax = weatherResponse.main.tempMax
                tempMin = weatherResponse.main.tempMin
                description = weatherResponse.weather[0].description
                pressure = weatherResponse.main.pressure
                wind = weatherResponse.wind.speed
//                sunrise = weatherResponse.sys.sunrise
//                sunset = weatherResponse.sys.sunset
            }
        }
    }

    
    func loadSunset() {
        Task {
            do{
                print("Do you see the horizon yet?")
                
                let sunResponse = try await
                fetchSunriseSunset()
                
                sunset = sunResponse.results.sunset
                sunrise = sunResponse.results.sunrise
            }
        }
    }
        
    func ai() async{
        if #available(iOS 26.0, *) {
            do {
                let session = LanguageModelSession()
                let result = try await session.respond(to: "You are the Weather Pal of the App user, who is using the weather app. Give the user some tips what he should wear, based on these weather conditions: temperature: \(temperature), max: \(tempMax), min: \(tempMin), description: \(description), pressure: \(pressure), wind: \(wind)")
                // Do something with result if needed
                print(result.content)
            } catch {
                print("AI error: \(error)")
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    var body: some View {
        VStack{
            ZStack {
                if dayTime == true {
                    LinearGradient(colors: [Color.teal, Color.blue], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea(edges: .all)
                } else {
                    LinearGradient(colors: [Color.black, Color.yellow], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea(edges: .all)
                }
                    if wIconDesign == true { //Glass icon design
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()       //SHOW THE GLASS DESIGN AT START!!!
                            .frame(width: 250, height: 180)
                            .position(x: 210, y: 250)
                        
                    } else {
                        Image("Image")
                         .padding(.bottom, 430)
                         .padding(.horizontal, 10)
                    } //Changing the Cloud with the sun to moon(stars)fill, if day time is toggled didn't work, because I already using the glass icon logic...
                
                VStack{
                    //Text("\(weatherData?.locationName)")
                    Text("Berlin, DE")
                        .font(.system(size: 35, weight: .bold, design: .default))
                        .padding(.top, 10)
                        .colorInvert()
                    Spacer(minLength: 20)
                    Text(temperature.rounded().formatted() + "°C")
                    // Text("25°C")
                        .font(.system(size: 100, weight: .bold, design: .default))
                        .colorInvert()
                    // .padding(.bottom, 570) There is another way! "BETTER"
                    // .padding(.bottom, 570) Only for testing purposes...
                       // .position(x: 202, y: 190)
                       // .padding(.bottom, 500)
                        .padding(.bottom, 457)
                }
                VStack{ //AI Box (expandable)
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.primary.opacity(0.32))
                        .colorInvert()
                        .frame(width: 370, height: 180)
                       //.position(x:200, y:465)
                        .padding(.bottom, -150)
                        .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)

                }
            
                //Little RoundedRectangles start
                    VStack{
                        Spacer(minLength: 688)
                        HStack{
                            Spacer(minLength: 200)
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.primary.opacity(0.32))
                                .colorInvert()
                            // .frame(width: 180, height: 100)
                            // .position(x:100, y:620)
                                .padding(5)
                            Spacer(minLength: 2)
                                .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
                        }
                        .padding(.bottom, -10)
                    }
                    
                    VStack{
                        Spacer(minLength: 670)
                            .padding(.bottom, 10)
                        HStack{
                            Spacer(minLength: 3)
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.primary.opacity(0.32))
                                .colorInvert()
                            // .frame(width: 180, height: 100)
                            // .position(x:100, y:620)
                                .padding(5)
                            Spacer(minLength: 200)
                                .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
                        }
                        .padding(.bottom, -10)
                    }
                    
                    VStack{
                        Spacer(minLength: 580)
                        HStack{
                            Spacer(minLength: 3)
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.primary.opacity(0.32))
                                .colorInvert()
                            // .frame(width: 180, height: 100)
                            // .position(x:100, y:620)
                                .padding(5)
                            Spacer(minLength: 200)
                                .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
                        }
                        Spacer(minLength: 90)
                    }
                    
                    HStack{
                        Spacer(minLength: 200)
                        VStack{
                            Spacer(minLength: 578)
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.primary.opacity(0.32))
                                .colorInvert()
                            // .frame(width: 180, height: 100)
                            // .position(x:100, y:620)
                                .padding(7)
                            Spacer(minLength: 90)
                                .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
                        }
                    }
                //END RECTS
                
                VStack{
                    Spacer()
                    HStack{
                        Text(description)
                        //   .position(x:100 , y:634)
                            .colorInvert()
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .padding(.horizontal, 40)
                            .padding(.bottom, 29)
                        Spacer()
                    }
                    .padding(.vertical, 100)
                }
                
                VStack{
                    Spacer()
                    HStack{
                        Text(pressure.formatted() + " hPa" + "")
                        // .position(x:100, y:345)
                            .colorInvert()
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .padding(.horizontal, 60)
                            .padding(.bottom, 29)
                        Spacer()
                    }
                }
                
                VStack{
                    Spacer()
                    HStack{
                        Text(wind.formatted() + "m/s")
                           // .position(x:300, y:634)
                            .colorInvert()
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .padding(.leading, 200)
                            .padding(.bottom, 127)
                    }
                }
                
                    VStack{
                        Spacer()
                        HStack{
                        //Text(sunset)
                        Text("\(sunset) \(Image(systemName: "sunset.fill"))")
                            // .position(x:100, y:740) //HAVE TO FIX IT LATER!!!
                            .colorInvert()
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .padding(.leading, 200)
                            .padding(.bottom, 25)
                    }
                }
                
                //LOW AND HIGH START
                VStack{
                    Text("H: " + tempMax.rounded().formatted() + "°C")
                        .colorInvert()
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .position(x:140, y:340)
                }
                HStack{
                    Text("L: " + tempMin.rounded().formatted() + "°C")
                        .colorInvert()
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .position(x:270, y:340)
                }
            }
        }
            .onAppear(){
              loadData()
            loadSunset()
            }
        }
    }
    
#Preview {
    ContentView()
}


struct AI_Weather_AppTests { //At some point, AI helped me there, because the Foundation model framework is pretty new to me. (05. Oct. 2025)
    @State private var temperature: Double = 0
    @State private var tempMax: Double = 0
    @State private var tempMin: Double = 0
    @State private var description: String = ""
    @State private var pressure: Int = 0
    @State private var wind: Double = 0
    @State private var sunrise: String = ""
    @State private var sunset: String = ""
    
    func loadData() {
        Task {
            do {
                print("Data is on it's way! 🚀 (For AI)")
                
                let weatherResponse = try await fetchWeatherData() //Function Call in ContentView
                
                temperature = weatherResponse.main.temp
                tempMax = weatherResponse.main.tempMax
                tempMin = weatherResponse.main.tempMin
                description = weatherResponse.weather[0].description
                pressure = weatherResponse.main.pressure
                wind = weatherResponse.wind.speed
                //                sunrise = weatherResponse.sys.sunrise
                //                sunset = weatherResponse.sys.sunset
            }
        }
    }
    
    func ai() async{
        if #available(iOS 26.0, *) {
            do {
                let session = LanguageModelSession()
                let result = try await session.respond(to: "You are the Weather Pal of the App user, who is using the weather app. Give the user some tips what he should wear, based on these weather conditions: temperature: \(temperature), max: \(tempMax), min: \(tempMin), description: \(description), pressure: \(pressure), wind: \(wind)")
                // Do something with result if needed
                print(result.content)
            } catch {
                print("AI error: \(error)")
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

