//
//  Sunset-SunriseService.swift
//  Weather-Pal
//
//  Created by Tim Seufert on 06.08.25.
//

import Foundation

func fetchSunriseSunset() async throws -> SunResponse {
        let urlString = "https://api.sunrisesunset.io/json?lat=38.907192&lng=-77.036873"
    let url = URL(string: urlString)!
    let data = try Data(contentsOf: url)
    let decoder = JSONDecoder()
    let sunResponse = try decoder.decode(SunResponse.self, from: data)
    
    print(sunResponse)
    
    return sunResponse
}
