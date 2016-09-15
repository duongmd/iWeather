//
//  ViewController.swift
//  iWeather
//
//  Created by Student on 9/9/16.
//  Copyright © 2016 MD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    
  
    @IBOutlet weak var tempButton: UIButton!
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    @IBOutlet weak var donviLabel: UILabel!
    
    
    @IBAction func changeTemp(sender: AnyObject) {
        
        change()
    }
    
    func change(){
        let c = Double(tempButton.currentTitle!)

        if (donviLabel.text == "C") {
           
            tempButton.setTitle(String(c! * 2 + 32), forState: .Normal)
            donviLabel.text = "F"
            
        }
        else {
            let f = Double(tempButton.currentTitle!)
            
            tempButton.setTitle(String((f!-32)/2), forState: .Normal)
            donviLabel.text = "C"
            
        }
    }
    
    var quote = ["Learn to be happy with what you have while you pursue all that you dream","If you live to be a hundred, I want to live to be a hundred minus one day. So that I’ll never have to live without you","I have learned more from my failures than from my success"]
    
    var city = ["California","New Jesey","Mumbai"]
    
    var backgroundImage = ["Blood","Moon","Sun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func randomButton(sender: AnyObject) {
    
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        cityLabel.text = city[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quote.count)))
        quoteLabel.text = quote[quoteIndex]
        
        let imageIndex = Int(arc4random_uniform(UInt32(backgroundImage.count)))
        backgroundImageView.image = UIImage.init(named: backgroundImage[imageIndex])
        
        getTemp()
    }
    
    func getTemp() {
    let randomNumber = String(format: "%2.1f", tempRandom())
        tempButton.setTitle(randomNumber, forState: .Normal)
    
    }
    
    
    func tempRandom() ->  Double {
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
    }
    
   
    
}

