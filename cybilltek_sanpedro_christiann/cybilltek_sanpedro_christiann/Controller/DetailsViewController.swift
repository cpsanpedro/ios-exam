//
//  DetailsViewController.swift
//  cybilltek_sanpedro_christiann
//
//  Created by Christiann Carlos San Pedro on 14/02/2018.
//  Copyright © 2018 Christiann Carlos San Pedro. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
  //MARK: Properties
  @IBOutlet weak var detailTableView: UITableView!
  var selectedPerson: Persons? = nil
  let arrTitles = [titles.firstname,
                   titles.lastname,
                   titles.birthday,
                   titles.age,
                   titles.email,
                   titles.mobile_number,
                   titles.address,
                   titles.contact_person,
                   titles.contact_person_number]

  //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  //MARK: UITable View Data Source
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrTitles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: identifiers.cellDetailIdentifier) as? CellDetails
    if cell == nil {
      cell = CellDetails(style:UITableViewCellStyle.default, reuseIdentifier: identifiers.cellDetailIdentifier)
    }
    
    cell?.titleLabel.text = arrTitles[indexPath.row]
    var strValue = ""
    switch indexPath.row {
    case 0:
      strValue = selectedPerson?.firstname ?? ""
    case 1:
      strValue = selectedPerson?.lastname ?? ""
    case 2:
      strValue = selectedPerson?.birthday ?? ""
    case 3:
      let birthday = DateUtil.getDateOf((selectedPerson?.birthday)!, withFormat:"MMM d, YYYY")
      let age = DateUtil.calculateAge(Of:birthday)
      strValue = String(age)
    case 4:
      strValue = selectedPerson?.email ?? ""
    case 5:
      strValue = selectedPerson?.mobile_number ?? ""
    case 6:
      strValue = selectedPerson?.address ?? ""
    case 7:
      strValue = selectedPerson?.contact_person ?? ""
    case 8:
      strValue = selectedPerson?.contact_person_number ?? ""
    default: break
      
    }
    cell?.valueLabel.text = strValue 
    
    return cell!
  }

}
