//
//  WeatherViewController.swift
//  InAccuWeatherApp
//
//  Created by Bethany Belbin on 2019-07-26.
//  Copyright © 2019 Bethany Belbin. All rights reserved.
//

import UIKit

class WeatherViewController : UIViewController {
   
    @IBOutlet weak var WeatherImage: UIImageView!
    @IBOutlet weak var DateTime: UILabel!
    @IBOutlet weak var Temperature: UILabel!
    @IBOutlet weak var WeatherDescription: UILabel!
    @IBOutlet weak var WeatherLocation: UILabel!
    
    var location : String!
    
    //MARK: Class variables
    var weatherModel = WeatherModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherModel.getCurrentWeather(weatherViewController: self, locationEntered: location!)
        
    }

    
    //MARK: Addition of back button instead of segue to prevent multiple layers of view
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        
        DispatchQueue.main.async {
            self.WeatherDescription.text = self.weatherModel.main
            self.Temperature.text = String(self.weatherModel.temp) + "°C"
            self.WeatherLocation.text = self.weatherModel.randomLocation
            self.DateTime.text = self.weatherModel.date 
        }
        
        
    }
}
