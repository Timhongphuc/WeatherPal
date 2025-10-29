//
//  MistralAPI.swift
//  Weather-Pal
//
//  Created by Tim Seufert on 21.08.25.
//

import Foundation

struct MistralResponse: Codable {
    let choices : [Choice]
}

struct Choice : Codable {
    let message : Message
}

struct Message: Codable {
    let content : String
}
