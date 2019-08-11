//
//  WeatherModel.swift
//  InAccuWeatherApp
//
//  Created by Bethany Belbin on 2019-07-26.
//  Copyright © 2019 Bethany Belbin. All rights reserved.
//

import Foundation

class WeatherModel {
    var main : String = ""
    var icon : String = ""
    var temp : Int = 2
    var randomLocation = ""
    var date : String = ""
    
    private let weatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather?"
    private let weatherMapAPIKey = "9e48efea8d59bdb0d07e7c0d13b4def7"
    
    var locationEntered : String = ""
    
    let locationsList = ["Barrie,CA", "Sydney,AU", "London,UK", "Tokyo,JP", "Venice,IT", "Resolute,CA", "San Francisco,US", "Chandigarh,IN", "Paris,FR", "Reykjavik,IS", "Berlin,DE", "Kampala,UG", "Moscow,RU", "Lima,PE", "Rio De Janeiro,BR", "Amsterdam,NL", "Cherrapunji,IN", "Cambridge,NZ", "Willemstad,CW", "Beijing,CN", "Geneva,CH"]
    
    func getCurrentWeather(weatherViewController : WeatherViewController, locationEntered: String) {
        
        func getRandomLocation () {
            print ("HERE!")
            return randomLocation = locationsList.randomElement()!
        }
        
        getRandomLocation()
        
        while ( randomLocation == locationEntered) {
            getRandomLocation()
        }
            print ("abc" + randomLocation)
        let api_url = weatherMapBaseURL + "q=" + randomLocation + "&units=metric" + "&APPID=" + weatherMapAPIKey
        
        print ("url is \(api_url)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self.date = "\(currentDate)"
        
        if let url = URL(string: api_url) {
            let dataTask = URLSession.shared.dataTask(with: url) {
                data, response, error in
                if var dataReceived = data {
                    let jsonString = String(data: dataReceived, encoding: .utf8)
                    print ("json \(jsonString)")
                    
                    do {
                        let json = try JSON(data: dataReceived)
                        
                            for item in json["weather"].arrayValue {
                                self.main = item["main"].stringValue
                                self.icon = item["icon"].stringValue
                            }
                        
                         self.temp = Int(round(json["main"]["temp"].doubleValue))
                            print(self.temp)
                        
                        weatherViewController.updateUI()
                        
                    } catch let err {
                        print ("It dun messed up the JSON thingy with the swifty-ness \(err)")
                    }
                    
                    }
                }
                dataTask.resume()
            }
        }
        
}

