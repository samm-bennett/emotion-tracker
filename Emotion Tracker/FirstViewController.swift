//
//  FirstViewController.swift
//  Emotion Tracker
//
//  Created by Thomas Bennett on 7/7/14.
//  Copyright (c) 2014 Thomas Bennett. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    var dataStore: EmotionsDataStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO: Load records from memory
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pushEmotionButton(sender: AnyObject) {
        if let emotionButton = sender as? UIButton {
            if var emotionRecords = dataStore {
                let emotion = Emotion(name: emotionButton.titleLabel.text, color: emotionButton.backgroundColor)
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                
            }
        }
    }
}

