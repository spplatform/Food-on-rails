//
//  ViewController.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/27/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testRequest()
    }

    
    func testRequest() {
        request("https://raw.githubusercontent.com/Headmast/swift_study/master/test_json").responseJSON { response in
            print(response)
        }
        print("viewDidLoad ended")
        
        RouteAPI.ticketIdRouteGet(id: "1") { (respose, error) in
            print(respose)
            print(respose?.trainNumber ?? "nan")
        }
    }

}

