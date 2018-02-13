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
  
  //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      self.getJson()
        // Do any additional setup after loading the view.
    }
  
  //MARK: TableView DataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier:cellIdentifiers.listCellIdentifier, for: indexPath)
    cell.textLabel?.text = "hooray"
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
          }
          case .failure(let error):
            print(error)
        }
        print("response:\(response)")
    }
  }
  
  func save(_ json:Any) {
    
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
