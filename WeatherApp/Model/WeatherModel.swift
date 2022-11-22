//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Никита Швец on 21.11.2022.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName:String {
        switch conditionId {
        case 200..<233:
            return "cloud.bolt.rain.fill"
        case 300..<322:
            return "cloud.drizzle.fill"
        case 500..<532:
            return "cloud.rain.fill"
        case 600...623:
            return "cloud.snow.fill"
        case 700...782:
            return "cloud.fog.fill"
        case 800:
            return "sun.max"
        case 801..<805:
            return "cloud.fill"
        default:
            return "error"
        }
    }
    
}
