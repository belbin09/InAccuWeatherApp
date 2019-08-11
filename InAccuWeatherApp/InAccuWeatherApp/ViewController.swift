//
//  ViewController.swift
//  InAccuWeatherApp
//
//  Created by Bethany Belbin on 2019-07-26.
//  Copyright © 2019 Bethany Belbin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputLocationTextField: UITextField!
    
    var location : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SearchButton(_ sender: UIButton) {
        location =  inputLocationTextField.text!
        

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "btnSearch") {
            let secondViewController = segue.destination as! WeatherViewController
            secondViewController.location = location
        }
    }
}

