//
//  WeatherService.swift
//  Weather-Pal
//
//  Created by Tim Seufert on 23.07.25.
//

import Foundation

func fetchWeatherData() async throws -> WeatherResponse {
    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=52.508150&lon=13.469173&appid=d97f3662e4f3b97b7fac6baf5f2ca858&units=metric")!
    
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
    
    print ("Temperatur: \(weatherResponse.main.temp)")
    print ("Beschreibung: \(weatherResponse.weather[0].description)")
    print ("Maximal Temperatur: \(weatherResponse.main.tempMax)")
    print ("Minimal Temperatur: \(weatherResponse.main.tempMin)")
    print("Druck: \(weatherResponse.main.pressure)")
    print("Sonnenaufgang: \(weatherResponse.sys.sunrise)")
    print("Sonnenuntergang: \(weatherResponse.sys.sunset)")
    
    return weatherResponse
}
