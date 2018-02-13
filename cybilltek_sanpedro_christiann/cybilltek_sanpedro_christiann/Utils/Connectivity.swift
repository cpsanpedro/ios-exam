//
//  Connectivity.swift
//  cybilltek_sanpedro_christiann
//
//  Created by Christiann Carlos San Pedro on 14/02/2018.
//  Copyright © 2018 Christiann Carlos San Pedro. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
  class func isConnected() -> Bool {
    return NetworkReachabilityManager()!.isReachable
  }
}
