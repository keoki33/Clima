//
//  WeatherManager.swift
//  Clima
//
//  Created by Keoki on 4/4/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=38fe7a8e5897d7609a473d87d3b8737d"
    
    func fetchWeather(cityName: String)  {
        let urlString = "\(weatherUrl)&q=\(cityName)"
performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String)  {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            task.resume()
        }
        
        
    }
    
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
        if error != nil {
            print(error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
    
}
