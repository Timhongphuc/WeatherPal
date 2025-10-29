//
//  ContentView.swift
//  Weather-Pal
//
//  Created by Tim Seufert on 13.07.25.
//

import SwiftUI

struct TestView: View {
    @State private var temperature: Double = 0
    @State private var tempMax: Double = 0
    @State private var tempMin: Double = 0
    @State private var description: String = ""
    
    
    @State private var sunset: String = ""
    @State private var sunrise: String = ""
    //Functions: ---
    
    func loadData() {
        Task {
            do {
                print("Data is on it's way! 🚀")
                
                let weatherResponse = try await fetchWeatherData() //Function Call in ContentView
                
                temperature = weatherResponse.main.temp
                tempMax = weatherResponse.main.tempMax
                tempMin = weatherResponse.main.tempMin
                description = weatherResponse.weather[0].description
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
    
//---------------------------------------------------------------
    
    var body: some View {
        ZStack{
//            LinearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea(edges: .all)
            Rectangle() //Schwarzer Hintergrund wird generiert
                .fill(Color.black)
                .cornerRadius(20)
                .ignoresSafeArea(edges: .all)
            
            VStack { //Weißes Testfeld wird generiert
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(20)
                    .padding(.top, 200)
                    .padding(.bottom, 200)
                    .padding()
            }
            
            VStack{
                    Text(temperature.rounded().formatted() + "°C")
                        .font(.system(size: 60, weight: .bold, design: .default))
                        .foregroundColor(.black)
                        .padding()
                    
                    HStack{
                        Text("L: " + tempMin.rounded().formatted() + "°C") //TempMax
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.black)
                        
                        Text("H: " + tempMax.rounded().formatted() + "°C") //TempMin
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.black)
                            .padding(.leading, 40)
                    }
                    Text("Descripton: " + description)
                        .fontWeight(.bold)
                
                Text("Sunrise: " + sunrise) //Have to format it in the right format!
                    .fontWeight(.bold)
                }
            
            VStack{
                Spacer()
                
                
                Button{
                    loadData()
                    //Are you searching for the button action? It's on the top stupid ^
                    loadSunset()
                } label: {
                     Text("Load Weather Data")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 50)
                    .background(
                        Capsule()
                            .fill(Color.blue)
                    )
                }
            }
            .padding()
        }
//    .onAppear(){
//    loadData()  //ACTIVATE IT IN THE REAL VIEW FOR INSTANT LOAD OF DATA. FOR TEST PUPOSES DONT ACTIVATE IT HERE --> API CALLS ARE PRICELESS!
//    }
    }
}

#Preview {
    TestView()
}
//Made on earth by humans. Bye GH copilot.
