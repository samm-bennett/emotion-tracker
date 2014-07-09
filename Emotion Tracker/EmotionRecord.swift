//
//  EmotionRecord.swift
//  Emotion Tracker
//
//  Created by Thomas Bennett on 7/7/14.
//  Copyright (c) 2014 Thomas Bennett. All rights reserved.
//

import Foundation
import UIKit

class Emotion : NSObject, NSCoding {
    // Anger, Fear, Happiness, Sadness
    let name: String
    let color: UIColor
    
    init(name: String, color: UIColor) {
        self.color = color
        self.name = name
    }
    
    init(coder aDecoder: NSCoder!) {
        name = aDecoder.decodeObjectForKey("name") as String
        color = aDecoder.decodeObjectForKey("color") as UIColor
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(color, forKey: "color")
    }
    
    override var description : String {
    return name;
    }
}

class EmotionRecord : NSObject, NSCoding  {
    let timestamp: NSDate
    let emotion: Emotion
    let tags: String[]
    
    init(timestamp: NSDate, emotion: Emotion, tags: String[]) {
        self.timestamp = timestamp
        self.emotion = emotion
        self.tags = tags
    }
    
    init(coder aDecoder: NSCoder!) {
        timestamp = aDecoder.decodeObjectForKey("timestamp") as NSDate
        emotion = aDecoder.decodeObjectForKey("Emotion") as Emotion
        tags = aDecoder.decodeObjectForKey("tags") as String[]
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(emotion, forKey: "emotion")
        aCoder.encodeObject(timestamp, forKey: "timestamp")
        aCoder.encodeObject(tags, forKey: "tags")
    }
    
    override var description : String {
    return "\(emotion.name) \(timestamp) \(tags)"
    }
}