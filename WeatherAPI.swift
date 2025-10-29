//
//  WeatherAPI.swift
//  Weather-Pal
//
//  Created by Tim Seufert on 19.07.25.
//

import Foundation

struct Weather: Codable{ //IST EIN ARRAY!!! -> [0]
    let description: String
}
    
struct Main: Codable{
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    //let pressure: Double (Ist manchmal auch eine ganze Zahl.)
    let pressure : Int
    let humidity: Int
 
    
    // JSON-Schlüssel zu Swift-Eigenschaftsnamen zuordnen GH-COPILOT
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

struct Wind: Codable{
    let speed: Double
}

struct Sys: Codable{
    let sunrise: Int
    let sunset: Int
}

struct WeatherResponse: Codable {
    let weather: [Weather]    // Array von Weather-Objekten
    let main: Main           // Ein Main-Objekt
    let wind: Wind           // Ein Wind-Objekt
    let sys: Sys             // Ein Sys-Objekt
}
