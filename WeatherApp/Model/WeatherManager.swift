//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Никита Швец on 18.11.2022.
//

import Foundation

final class WeatherManager {
    let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=4da689cbd6d478deb357ef73d3ac3b47&q="
    
    func fetchWeather(cityName: String) {
        let urlString = "\(WeatherURL)\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handler(data:response:error:))
            task.resume()
        }
    }
    
    func handler(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print("no data")
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}


