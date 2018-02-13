//
//  Person.swift
//  cybilltek_sanpedro_christiann
//
//  Created by Christiann Carlos San Pedro on 13/02/2018.
//  Copyright © 2018 Christiann Carlos San Pedro. All rights reserved.
//

import UIKit
import CoreData

class Person: NSManagedObject {
  
  class func addPerson(withData data:[String:Any]) {
    let containerContext: NSManagedObjectContext = ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!
    var result: [Persons] = []
    var person: Persons?
    
    let request: NSFetchRequest<NSFetchRequestResult> = Persons.fetchRequest()
    request.predicate = NSPredicate(format: "email = %@",data["email"] as! String)
    
    do {
      result = try containerContext.fetch(request) as! [Persons]
      if result.count == 0 {
        NSEntityDescription.insertNewObject(forEntityName: "Persons", into: containerContext)
        person = Persons(context:containerContext)
      }
      else {
        person = result.last
      }
    } catch let error as NSError {
      print("error:\(error)")
    }
    
    person?.email = data["email"] as? String
    person?.firstname = data["firstname"] as? String
    person?.lastname = data["lastname"] as? String
    person?.birthday = data["birthday"] as? Date
    person?.mobile_number = data["mobile_number"] as? String
    person?.address = data["address"] as? String
    person?.contact_person = data["contact_person"] as? String
    person?.contact_person_number = data["contact_person_number"] as? String
    
    do {
      try containerContext.save()
    } catch let error as NSError {
      print("error saving: \(error)")
    }
    
  }
  
  class func fetchAllPerson() -> [NSManagedObject] {
    let containerContext: NSManagedObjectContext = ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!
    var result: [Persons] = []
    
    let request: NSFetchRequest<NSFetchRequestResult> = Persons.fetchRequest()
    request.predicate = NSPredicate(format: "email != %@", "")
    
    do {
      result = try containerContext.fetch(request) as! [Persons]
      print("all person:\(result)")
    } catch let error as NSError {
      print("error fetch:\(error)")
    }
    return result
  }

}
