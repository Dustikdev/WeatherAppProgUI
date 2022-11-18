//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Никита Швец on 16.11.2022.
//

import UIKit

class WeatherVC: UIViewController, UITextFieldDelegate {

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
        searchTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
        textField.placeholder = "Search"
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.placeholder = "Search"
        return true
    }

}
