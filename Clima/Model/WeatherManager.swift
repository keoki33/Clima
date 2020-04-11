//
//  WeatherManager.swift
//  Clima
//
//  Created by Keoki on 4/4/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation


protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=38fe7a8e5897d7609a473d87d3b8737d"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String)  {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) -> Void  {
        let urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longtitude)"
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString: String)  {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            //            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJson(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
        
        
    }
    
    
    
    
    //weatherManager.fetchWeather(latitude: lat, longtitude: lon)
    
    
    func parseJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            print(weather.temperatureString)
            return weather
        }
        catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
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





