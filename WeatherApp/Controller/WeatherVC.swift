//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Никита Швец on 16.11.2022.
//

import UIKit

class WeatherVC: UIViewController {

    let backgroundImageView = UIImageView()
    let geoButton = UIButton()
    let searchTextField = UITextField()
    let searchButton = UIButton()
    let weatherImageView = UIImageView()
    let degreeLabel = UILabel()
    let celsiumLabel = UILabel()
    let cityLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

}
