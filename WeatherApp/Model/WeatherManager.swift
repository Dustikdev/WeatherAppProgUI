//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Никита Швец on 18.11.2022.
//

import Foundation

final class WeatherManager {
    let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=4da689cbd6d478deb357ef73d3ac3b47&q=Belgrade"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(WeatherURL)&q=\(cityName)"
    }
    
}


