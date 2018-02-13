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
    request.predicate = NSPredicate(format: "email = %@",data[personsKey.email] as! String)
    
    do {
      result = try containerContext.fetch(request) as! [Persons]
      if result.count == 0 {
        NSEntityDescription.insertNewObject(forEntityName: personsKey.entityPersons, into: containerContext)
        person = Persons(context:containerContext)
      }
      else {
        person = result.last
      }
    } catch let error as NSError {
      print("error:\(error)")
    }
    
    person?.email = data[personsKey.email] as? String
    person?.firstname = data[personsKey.firstname] as? String
    person?.lastname = data[personsKey.lastname] as? String
    person?.birthday = data[personsKey.birthday] as? String
    person?.mobile_number = data[personsKey.mobile_number] as? String
    person?.address = data[personsKey.address] as? String
    person?.contact_person = data[personsKey.contact_person] as? String
    person?.contact_person_number = data[personsKey.contact_person_number] as? String
    
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
