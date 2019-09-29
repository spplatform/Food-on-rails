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
    var cafeResponse: CafeResponse?
    var routeRespone: RouteResponse?
    
    @IBOutlet var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        
        if let cartButton = getCartButton() {
                navigationItem.rightBarButtonItems = [cartButton]
            }
            NotificationCenter.default.addObserver(self, selector: #selector(updateCart(notification:)), name: .updateCart, object: nil)
        }
        
    deinit {
        NotificationCenter.default.removeObserver(self, name: .updateCart, object: nil)
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
                destinationVC.routeRespone = routeRespone
                destinationVC.routeResponseStops = routeResponseStops
            }
        }
    }
}

// MARK: - CartButton logic

extension StationViewController {
    @objc func updateCart(notification: NSNotification) {
        if let cartButton = getCartButton() {
            navigationItem.rightBarButtonItems = [cartButton]
        }
    }
    
    func getCartButton() -> UIBarButtonItem? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let dishes = appDelegate.dishesList {
            let cartBtn: UIBarButtonItem
            if dishes.isEmpty {
                cartBtn = UIBarButtonItem(
                    image: UIImage(named: "btnCart.png")?.withRenderingMode(.alwaysOriginal),
                style: .plain, target: self, action: #selector(handleCartTap))
                return cartBtn
            } else {
                if let image = UIImage(named: "btnCartActive.png") {
                    cartBtn = UIBarButtonItem(
                    image: image.withRenderingMode(.alwaysOriginal),
                    title: " " + String(dishes.count) + " ", target: self, action: #selector(handleCartTap))
                    return cartBtn
                }
            }
        }
        return nil
    }
    
    @objc func handleCartTap() {
        self.performSegue(withIdentifier: "openCart", sender: self)
    }
}
