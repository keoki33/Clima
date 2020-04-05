//
//  WeatherModel.swift
//  Clima
//
//  Created by Keoki on 5/4/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation


struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        String(format: "%.1f",temperature)
    }
    
    var conditionName: String {
                 switch conditionId {
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
        
    
    
        
    }
    
//    func getConditionName(weatherId: Int) -> String {
//         switch weatherId {
//         case 200..<300:
//             return "cloud.bolt.rain"
//         case 300..<400:
//             return "cloud.drizzle"
//         case 500..<600:
//             return "cloud.rain"
//         case 600..<700:
//             return "cloud.snow"
//         case 700..<800:
//             return "tornado"
//         case 800:
//             return "sun.max"
//         case 801..<900:
//             return "cloud"
//         default:
//             return "error"        }
//     }
//
    

