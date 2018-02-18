//
//  ListViewController.swift
//  cybilltek_sanpedro_christiann
//
//  Created by Christiann Carlos San Pedro on 12/02/2018.
//  Copyright © 2018 Christiann Carlos San Pedro. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
  //MARK: Properties
  @IBOutlet weak var listTableView: UITableView!
  var arrPersons: [Persons] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    listTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifiers.listCellIdentifier)
          navigationItem.title = titles.listOfPersons
          arrPersons = self.read()
          if Connectivity.isConnected() && self.arrPersons.count == 0 {
            self.setupProgressHUD()
            self.getJson()
          }
          else if arrPersons.count == 0 {
            AlertView.showSimpleAlert(view: self, message: titles.noConnection)
          }
    
    
    // Do any additional setup after loading the view.
  }
  
  //MARK: TableView DataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrPersons.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier:identifiers.listCellIdentifier, for: indexPath)
    let person = arrPersons[indexPath.row]
    
    cell.textLabel?.text = person.firstname
    return cell
  }
  
  //MARK: TableView Delegate
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = DetailsViewController(nibName:identifiers.detailsNibName, bundle:nil)
    self.navigationController?.pushViewController(vc, animated: true)
    vc.selectedPerson = arrPersons[indexPath.row]

  }
  
  
  //MARK: Custom Methods
  
  func setupProgressHUD() {
    SVProgressHUD.show()
    SVProgressHUD.setDefaultStyle(.dark)
  }
  
  func getJson() {
    let requestManager = RequestManager.get("cpsanpedro/sample.json", withParameter:[:])
    Alamofire.request(requestManager)
      .validate()
      .responseJSON { (response) in
        switch response.result {
        case .success:
          if let json = response.result.value {
            self.save(json)
            self.arrPersons = self.read()
            self.listTableView.reloadData()
            SVProgressHUD.dismiss()
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
  }
  
  func read() -> [Persons] {
    let read = Person.fetchAllPerson()
    return read as! [Persons]
  }

}

