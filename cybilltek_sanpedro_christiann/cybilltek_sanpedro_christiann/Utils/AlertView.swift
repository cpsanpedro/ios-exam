//
//  AlertView.swift
//  SampleCoreDataBridge
//
//  Created by Christiann Carlos San Pedro on 09/08/2017.
//  Copyright © 2017 Christiann Carlos San Pedro. All rights reserved.
//

import UIKit
import Foundation

class AlertView: NSObject {
  
  class func showSimpleAlert(view: UIViewController , message: String) {
    let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    
    DispatchQueue.main.async(execute: {
      view.present(alert, animated: true, completion: nil)
    })
  }
  
  class func showAlert(view: UIViewController, withTitle title:String, withMessage message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    
    DispatchQueue.main.async(execute: {
      view.present(alert, animated: true, completion: nil)
    })
  }


  
}


//extension UIViewController {
//  func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
//    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//    for (index, title) in actionTitles.enumerated() {
//      let action = UIAlertAction(title: title, style: .default, handler: actions[index])
//      alert.addAction(action)
//    }
//    self.present(alert, animated: true, completion: nil)
//  }
//}
//
//self.popupAlert(title: "Title", message: " Oops, xxxx ", actionTitles: ["Option1","Option2","Option3"], actions:[{action1 in
//  
//  },{action2 in
//    
//  }, nil])
