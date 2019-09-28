//
//  TicketViewController.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/28/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testRequest()
    }

    
    func testRequest() {
        RouteAPI.ticketIdRouteGet(id: "20073776662724") { (respose, error) in
            print("request")
            print(respose?.trainNumber ?? "nan")
        }
    }

}
