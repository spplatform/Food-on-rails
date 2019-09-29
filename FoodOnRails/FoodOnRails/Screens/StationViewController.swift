//
//  StationViewController.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/28/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit
import AlamofireImage

class StationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var routeResponseStops: RouteResponseStops?
    
    @IBOutlet var tableView: UITableView!
    
    var routeRespone: RouteResponse?
    var cafeResponse: CafeResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        
        let customImageBarBtn2 = UIBarButtonItem(
            image: UIImage(named: "btnCart.png")?.withRenderingMode(.alwaysOriginal),
        style: .plain, target: self, action: #selector(handleCarttTap))
        navigationItem.rightBarButtonItems = [customImageBarBtn2]
    }
    
    @objc func handleCarttTap() {
        self.performSegue(withIdentifier: "openCart", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routeResponseStops?.cafes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CafeTableViewCell", for: indexPath) as! CafeTableViewCell
        if let station = routeResponseStops {
            cell.cafeName.text = station.cafes[indexPath.row].name
            cell.kitchenType.text = station.cafes[indexPath.row].cuisine
            cell.minOrder.text = String(station.cafes[indexPath.row].minimumPrice ?? 0)
            if let imageUrl = station.cafes[indexPath.row].positions.first?.imageUrl {
                let url = URL(string: imageUrl)!
                cell.logo.af_setImage(withURL: url)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cafeResponse = self.routeResponseStops?.cafes[indexPath.row]
        self.performSegue(withIdentifier: "openMenu", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openMenu" {
            if let destinationVC = segue.destination as? MenuViewController {
                destinationVC.cafeResponse = cafeResponse
            }
        }
    }
}

