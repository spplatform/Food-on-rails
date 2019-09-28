//
//  TicketViewController.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/28/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit
import BarcodeScanner

class TicketViewController: UIViewController {
    
    @IBOutlet var ticketNumber: UITextField!
    @IBOutlet var clearBtn: UIButton!
    @IBOutlet var cameraBtn: UIButton!
    @IBOutlet var okBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testRequest()
    }
    
    @IBAction func handleScannerPresent(_ sender: Any, forEvent event: UIEvent) {
      let viewController = makeBarcodeScannerViewController()
      viewController.title = "Barcode Scanner"
      present(viewController, animated: true, completion: nil)
    }
    
    private func makeBarcodeScannerViewController() -> BarcodeScannerViewController {
      let viewController = BarcodeScannerViewController()
      viewController.codeDelegate = self
      viewController.errorDelegate = self
      viewController.dismissalDelegate = self
      return viewController
    }

    
    func testRequest() {
        RouteAPI.ticketIdRouteGet(id: "20073776662724") { (respose, error) in
            print("request")
            print(respose?.trainNumber ?? "nan")
        }
    }
}

// MARK: - BarcodeScannerCodeDelegate

extension TicketViewController: BarcodeScannerCodeDelegate {
  func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
    ticketNumber.text = code
    print("Barcode Data: \(code)")
    print("Symbology Type: \(type)")
    controller.dismiss(animated: true, completion: nil)
    //controller.reset()
//    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//      controller.reset()
//    }
  }
}

// MARK: - BarcodeScannerErrorDelegate

extension TicketViewController: BarcodeScannerErrorDelegate {
  func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
    print(error)
  }
}

// MARK: - BarcodeScannerDismissalDelegate

extension TicketViewController: BarcodeScannerDismissalDelegate {
  func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
    controller.dismiss(animated: true, completion: nil)
  }
}
