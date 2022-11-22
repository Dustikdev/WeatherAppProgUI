//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Никита Швец on 21.11.2022.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
