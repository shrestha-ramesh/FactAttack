//
//  ResultViewController.swift
//  FactAttack
//
//  Created by Ramesh Shrestha on 4/24/19.
//  Copyright © 2019 Ramesh Shrestha. All rights reserved.
//

import UIKit
class ResultViewController: UIViewController{
    @IBOutlet var ScoreLabel: UILabel!
    @IBOutlet var HighLabel: UILabel!
    
    
    var ScoreText = Int()
    var HighScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let HighScoreDefault = UserDefaults.standard
        if HighScoreDefault.value(forKey: "HighScore") != nil {
            HighScore = (HighScoreDefault.value(forKey: "HighScore") as! NSInteger?)!
            HighLabel.text = NSString(format: "HighScore : %i", HighScore) as String
        }
        update()
    }
    func update(){
        ScoreLabel.text = NSString(format: "ScoreText : %i", ScoreText) as String
        if ScoreText > HighScore {
        HighScore = ScoreText
        HighLabel.text = NSString(format: "HighScore : %i", HighScore) as String
        
        let HighscoreDefault = UserDefaults.standard
        HighscoreDefault.set(HighScore, forKey: "HighScore")
        HighscoreDefault.synchronize()
    }
    }
}
