//
//  WeatherManager.swift
//  Clima
//
//  Created by Keoki on 4/4/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "http://api.openweathermap.org/data/2.5/weather?units=metric&appid=38fe7a8e5897d7609a473d87d3b8737d"
    
    func fetchWeather(cityName: String)  {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        print(urlString)
    }
    
    
    
}
