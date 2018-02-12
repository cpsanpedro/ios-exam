//
//  FileUtil.swift
//
//
//  Created by Christiann Carlos San Pedro on 23/07/2017.
//  Copyright © 2017 Christiann Carlos San Pedro. All rights reserved.
//

import UIKit

class FileUtil: NSObject {
    
    public func fetchJsonData(_ fileName: String) -> [String:AnyObject] {
        let jsonFile = Bundle.main.path(forResource: fileName, ofType: "json")
        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile!))
        let arrData = (try? JSONSerialization.jsonObject(with: jsonData!))
        return arrData as! [String:AnyObject]
    }
    
    public func saveImageFile(_ image:UIImage, withName fileName:String) {
        let pngData = UIImagePNGRepresentation(image)
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let fileUrl = documentDirectory.appendingPathComponent(fileName)
            
            try pngData?.write(to: fileUrl)
        } catch {
            print("error")
        }
    }
  
    
    public func applicationDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        
    }
    
    public func loadImage(_ fileName:String) -> UIImage {
        let workSpacePath = applicationDocumentsDirectory().appendingPathComponent(fileName)
        let img = UIImage(contentsOfFile:workSpacePath.path)
        return img!
    }
  
  public func isFileExists(_ fileName:String) -> Bool {
    let workSpacePath = applicationDocumentsDirectory().appendingPathComponent(fileName)
    let fileManager = FileManager.default
    return fileManager.fileExists(atPath: workSpacePath.path)
    
  }
  
  public func readFile(_ fileName:String) {
    let workSpacePath = applicationDocumentsDirectory().appendingPathComponent(fileName)
      do {
        let text2 = try String(contentsOf: workSpacePath, encoding: String.Encoding.utf8)
        print(text2)
      }
      catch {/* error handling here */print("file not found")}
  }
  
  public func writeString(_ string:String, toFile fileName:String) {
    let workSpacePath = applicationDocumentsDirectory().appendingPathComponent(fileName)
    
      //writing
      do {
        try string.write(to: workSpacePath, atomically: false, encoding: String.Encoding.utf8)
      }
      catch {/* error handling here */}

    
    }
  
  public func appendString(_ string:String, toFile fileName:String) {
    let workSpacePath = applicationDocumentsDirectory().appendingPathComponent(fileName)
    let fileManager = FileManager.default
    let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)!
    if fileManager.fileExists(atPath: workSpacePath.path) {
      if let fileHandle = FileHandle(forWritingAtPath: workSpacePath.path) {
        fileHandle.seekToEndOfFile()
        fileHandle.write(data)
        fileHandle.closeFile()
      }
      else {
        print("Can't open fileHandle")
      }
    }
    else {
      do {
        try data.write(to: workSpacePath, options: .atomic)
      } catch {
        print("cant append")
      }
    }
  }
  
  public func deleteFile(_ fileName:String) {
    let workSpacePath = applicationDocumentsDirectory().appendingPathComponent(fileName)
    let fileManager = FileManager.default
    do {
      try fileManager.removeItem(at: workSpacePath)

      print("deleted \(workSpacePath.lastPathComponent)")
      
    } catch {
      print("Could not clear temp folder: \(error)")
    }
  }
}
