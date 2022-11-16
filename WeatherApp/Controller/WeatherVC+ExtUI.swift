//
//  WeatherVCUI_Ext.swift
//  WeatherApp
//
//  Created by Никита Швец on 16.11.2022.
//

import UIKit

extension WeatherVC {
    
    func configureUI() {
        configureBackgroundImage()
        configureGeoButton()
        configureSearchButton()
        configureSearchTextField()
        configureWeatherImageView()
        configureCelsiumLabel()
        configuredegreeLabel()
        configureCityLabel()
    }
    
    func configureBackgroundImage() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "light_background")
        backgroundImageView.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureGeoButton() {
        view.addSubview(geoButton)
        geoButton.translatesAutoresizingMaskIntoConstraints = false
        geoButton.tintColor = .black
        geoButton.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        NSLayoutConstraint.activate([
            geoButton.heightAnchor.constraint(equalToConstant: 44),
            geoButton.widthAnchor.constraint(equalToConstant: 44),
            geoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            geoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    func configureSearchButton() {
        view.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.tintColor = .black
        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
        NSLayoutConstraint.activate([
            searchButton.heightAnchor.constraint(equalToConstant: 44),
            searchButton.widthAnchor.constraint(equalToConstant: 44),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    func configureSearchTextField() {
        view.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search"
        searchTextField.font = .systemFont(ofSize: 22, weight: .medium)
        searchTextField.textAlignment = .right
        searchTextField.backgroundColor = .systemFill
        searchTextField.layer.cornerRadius = 8
        searchTextField.autocapitalizationType = .words
        searchTextField.adjustsFontSizeToFitWidth = true
        searchTextField.minimumFontSize = 12
        searchTextField.returnKeyType = .go
        searchTextField.layer.sublayerTransform = CATransform3DMakeTranslation(-10, 0, -10)
        NSLayoutConstraint.activate([
            searchTextField.heightAnchor.constraint(equalToConstant: 44),
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: geoButton.trailingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -10)
        ])
    }
    
    func configureWeatherImageView() {
        view.addSubview(weatherImageView)
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.image = UIImage(systemName: "cloud.fill")
        weatherImageView.tintColor = .black
        weatherImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            weatherImageView.heightAnchor.constraint(equalToConstant: 120),
            weatherImageView.widthAnchor.constraint(equalToConstant: 120),
            weatherImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            weatherImageView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureCelsiumLabel() {
        view.addSubview(celsiumLabel)
        celsiumLabel.translatesAutoresizingMaskIntoConstraints = false
        celsiumLabel.text = "°C"
        celsiumLabel.font = .systemFont(ofSize: 100, weight: .regular)
        NSLayoutConstraint.activate([
            celsiumLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            celsiumLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 20)
        ])
    }
    
    func configuredegreeLabel() {
        view.addSubview(degreeLabel)
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        degreeLabel.text = "21"
        degreeLabel.font = .systemFont(ofSize: 90, weight: .heavy)
        NSLayoutConstraint.activate([
            degreeLabel.trailingAnchor.constraint(equalTo: celsiumLabel.leadingAnchor, constant: -10),
            degreeLabel.bottomAnchor.constraint(equalTo: celsiumLabel.bottomAnchor, constant: 0)
        ])
    }
    
    func configureCityLabel() {
        view.addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.text = "London"
        cityLabel.font = .systemFont(ofSize: 30, weight: .medium)
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor, constant: 20),
            cityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
}
