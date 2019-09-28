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
    
    var ticketId = ""
    var routeRespone: RouteResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketId = "20073776662724"
    }
    
    @IBAction func handleScannerPresent(_ sender: Any, forEvent event: UIEvent) {
        let viewController = makeBarcodeScannerViewController()
        viewController.title = "Barcode Scanner"
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func okPressed(_ sender: Any, forEvent event: UIEvent) {
        routRequest(for: ticketId)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openRoute" {
            if let destinationVC = (segue.destination as? UINavigationController)?.children.first as? RouteViewController {
                destinationVC.routeRespone = routeRespone
            }
        }
    }
    
    private func makeBarcodeScannerViewController() -> BarcodeScannerViewController {
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        return viewController
    }

    
    func routRequest(for tickeitId: String) {
        RouteAPI.ticketIdRouteGet(id: tickeitId) {[weak self] (respose, error) in
            print("request")
            self?.routeRespone = respose
            print(respose?.trainNumber ?? "nan")
            self?.performSegue(withIdentifier: "openRoute", sender: self)
        }
    }
}

// MARK: - BarcodeScannerCodeDelegate

extension TicketViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        ticketId = code
        ticketNumber.text = code
        print("Barcode Data: \(code)")
        print("Symbology Type: \(type)")
        controller.dismiss(animated: true, completion: nil)
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
