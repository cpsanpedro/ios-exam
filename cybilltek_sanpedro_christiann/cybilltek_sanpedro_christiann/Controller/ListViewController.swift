//
//  ListViewController.swift
//  cybilltek_sanpedro_christiann
//
//  Created by Christiann Carlos San Pedro on 12/02/2018.
//  Copyright © 2018 Christiann Carlos San Pedro. All rights reserved.
//

import UIKit
//import FileUtil

import Alamofire

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
  var arrPersons: [Persons] = []
  
  //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.getJson()
      arrPersons = self.read()
      // Do any additional setup after loading the view.
    }
  
  //MARK: TableView DataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrPersons.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier:cellIdentifiers.listCellIdentifier, for: indexPath)
    let person = arrPersons[indexPath.row]
    
    cell.textLabel?.text = person.firstname
    return cell
  }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  //MARK: Custom Methods
  func getJson() {
    let requestManager = RequestManager.get("cpsanpedro/sample.json", withParameter:[:])
    Alamofire.request(requestManager)
    .validate()
      .responseJSON { (response) in
        switch response.result {
          case .success:
            if let json = response.result.value {
              print("json:\(json)")
              self.save(json)
//              self.read()
          }
          case .failure(let error):
            print(error)
        }
        print("response:\(response)")
    }
  }
  
  func save(_ json:Any) {
    let person = json as! [String:Any]
    if let arrayPerson = person["person"] as? [Any] {
      for obj in arrayPerson {
        if let dictObj = obj as? [String:Any] {
          Person.addPerson(withData: dictObj)
        }
        
      }
    }
 

//    Person.addPerson(withData: formattedJson)
  }
  
  func read() -> [Persons] {
    let read = Person.fetchAllPerson()
    print("fetch:\(read)")
    
    return read as! [Persons]
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
