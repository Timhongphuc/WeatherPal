//
//  Sunset-SunriseAPI.swift
//  Weather-Pal
//
//  Created by Tim Seufert on 06.08.25.
//

import Foundation

struct results: Codable{
   let sunrise: String
   let sunset: String
}

struct SunResponse: Codable {
    let results: results
}
