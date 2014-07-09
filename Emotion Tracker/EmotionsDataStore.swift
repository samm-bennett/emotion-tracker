//
//  EmotionsDataStore.swift
//  Emotion Tracker
//
//  Created by Thomas Bennett on 7/7/14.
//  Copyright (c) 2014 Thomas Bennett. All rights reserved.
//

import Foundation

class EmotionsDataStore {
    var emotionRecords: Dictionary<Emotion, EmotionRecord[]>
    let dataPath: NSString
    var wasDataModified = false
    
    init() {
        let (dataPath, isPreviousFile) = EmotionsDataStore.createDataPath()
        self.dataPath = dataPath
        if (isPreviousFile) {
            emotionRecords = EmotionsDataStore.readRecordsFromDataPath(dataPath)
        } else {
            emotionRecords = Dictionary<Emotion, EmotionRecord[]>()
        }
    }
    
    func saveToDisk() {
        if (!wasDataModified) {
            return
        }
        
        var data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(emotionRecords)
        archiver.finishEncoding()
        data.writeToFile(dataPath, atomically: true)
    }
    
    class func readRecordsFromDataPath(dataPath: NSString) -> Dictionary<Emotion, EmotionRecord[]> {
        let codedData = NSData(contentsOfFile: dataPath)
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: codedData)
        let results = unarchiver.decodeObject() as Dictionary<Emotion, EmotionRecord[]>
        unarchiver.finishDecoding()
        return results
    }
    
    class func createDataPath() -> (String, Bool) {
        let pathPrefix = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let path = pathPrefix + "/data"
        var error: NSError?
        
        let fileManager = NSFileManager.defaultManager()
        let doesFileExist = fileManager.fileExistsAtPath(pathPrefix)
        if (!doesFileExist) {
            fileManager.createDirectoryAtPath(pathPrefix, withIntermediateDirectories: true, attributes: nil, error: &error)
        }
        
        if let error = error {
            println("Encountered error creating \(path). Error: \(error)")
        }
        
        return (path, doesFileExist)
    }
    
    func addRecord(emotion: Emotion) {
        // TODO: Need to pass in tags
        var tags = String[]()
        let emotionRecord = EmotionRecord(timestamp: NSDate.date(), emotion: emotion, tags: tags)
        
        if var record = emotionRecords[emotion] {
            record.append(emotionRecord)
        } else {
            let records = [emotionRecord]
            emotionRecords[emotion] = records
        }
        
        wasDataModified = true
    }
}
