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
      let file = FileUtil()
      if !file.isFileExists("sample.json") {
        self.downloadJson()
      }
      else {
        print("Meron na")
      }
      
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
  func downloadJson() {
    let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
    
    Alamofire.download(url.urlFirebaseJson, to: destination)
      .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { (progress) in
        print("Progress: \(progress.fractionCompleted)")
      }.validate().responseData { (response) in
        print(response.destinationURL!.lastPathComponent)
//        print(<#T##items: Any...##Any#>)
    }
    
    
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
