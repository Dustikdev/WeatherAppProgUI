//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Никита Швец on 16.11.2022.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController {

    let backgroundImageView = UIImageView()
    let geoButton = UIButton()
    let searchTextField = UITextField()
    let searchButton = UIButton()
    let weatherImageView = UIImageView()
    let degreeLabel = UILabel()
    let celsiumLabel = UILabel()
    let cityLabel = UILabel()
    let weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        locationManager.delegate = self
        weatherManager.delegate = self
        searchTextField.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    @objc func searchButtonTapped() {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.endEditing(true)
    }
    
    @objc func geoButtonTapped() {
        searchTextField.endEditing(true)
        locationManager.requestLocation()
    }
}

//MARK: - UITextFieldDelegate

extension WeatherVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            textField.endEditing(true)
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        textField.text = ""
        textField.placeholder = "Search"
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.placeholder = "Search"
        return true
    }
    

}

//MARK: - WeatherManagerDelegate

extension WeatherVC: WeatherManagerDelegate {
    
    func didUpdateWeather(weather: WeatherModel) {
        print(weather.temperatureString)
        DispatchQueue.main.async {
            self.degreeLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.weatherImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        guard let latitude = locations.last?.coordinate.latitude, let longitude = locations.last?.coordinate.longitude else { return }
        weatherManager.fetchWeather(lat: latitude, lon: longitude)
    }
//    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
