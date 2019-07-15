//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Tan Zhi Yang on 6/7/19.
//  Copyright © 2019 Tan Zhi Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flag1: UIButton!
    @IBOutlet weak var flag2: UIButton!
    @IBOutlet weak var flag3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var maxScore = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadFlags()
        askQuestion()
    }
    

    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        flag1.setImage(UIImage(named: countries[0]), for: .normal)
        flag2.setImage(UIImage(named: countries[1]), for: .normal)
        flag3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = "\(score)/\(maxScore) " + countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var message = ""
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = "Correct! Your score is \(score)/\(maxScore)"
        } else {
            title = "Wrong"
            score -= 1
            message = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
        }
        maxScore += 1
        
        var ac: UIAlertController
        if maxScore == 10 {
            ac = UIAlertController(title: "FINAL", message: "Final Score: \(score)/\(maxScore)", preferredStyle: .alert)
            // ac.addAction(UIAlertAction(title: "Restart", style: .destructive, handler: askQuestion))
            maxScore = 0
            score = 0
        } else {
            ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        present(ac, animated: true)
    }
    
    func loadFlags() {
        countries += ["estonia","france","germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        countries.shuffle()
        // 1 pixel on non-retina devices, 2 pixels on retina devices, 3 pixels on HD retina devices
        flag1.layer.borderWidth = 1
        flag2.layer.borderWidth = 1
        flag3.layer.borderWidth = 1
        
        flag1.layer.borderColor = UIColor.lightGray.cgColor
        flag2.layer.borderColor = UIColor.lightGray.cgColor
        flag3.layer.borderColor = UIColor.lightGray.cgColor
    }

}

