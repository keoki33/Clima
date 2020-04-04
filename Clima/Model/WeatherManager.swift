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
            //            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJson(weatherData: safeData)
                }
            }
            
            task.resume()
        }
        
        
    }
    
    func parseJson(weatherData: Data) -> Void {
        let decoder = JSONDecoder()
        do {
            let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
            let id = decodedData.weather[0].id
            print(getConditionName(weatherId: id))
        }
        catch {
            print(error)
        }
        
    }
    
    func getConditionName(weatherId: Int) -> String {
        switch weatherId {
        case 200..<300:
            return "cloud.bolt.rain"
        case 300..<400:
            return "cloud.drizzle"
        case 500..<600:
            return "cloud.rain"
        case 600..<700:
            return "cloud.snow"
        case 700..<800:
            return "tornado"
        case 800:
            return "sun.max"
        case 801..<900:
            return "cloud"
        default:
            return "error"        }
    }
    
    
    
    //    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
    //        if error != nil {
    //            print(error!)
    //            return
    //        }
    //        if let safeData = data {
    //            let dataString = String(data: safeData, encoding: .utf8)
    //        }
    //    }
    
}
