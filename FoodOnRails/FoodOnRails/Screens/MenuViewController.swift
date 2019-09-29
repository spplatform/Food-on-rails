//
//  MenuViewController.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/28/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit

var cafeResponse: CafeResponse?

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var cafeResponse: CafeResponse?
    var routeResponseStops: RouteResponseStops?
    var routeRespone: RouteResponse?
    
    var stopId = ""
    var cafeId = ""
    var dish:CafeDishResponse?
    
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
        return cafeResponse?.positions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "DishTableViewCell", for: indexPath) as! DishTableViewCell
        if let cafe = cafeResponse {
            cell.dishName.text = cafe.positions[indexPath.row].name
            cell.dishText.text = cafe.positions[indexPath.row].description
            cell.price.text = String(cafe.positions[indexPath.row].price)
            let url = URL(string: cafe.positions[indexPath.row].imageUrl)!
            cell.logo.af_setImage(withURL: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var newDish = DishInCart()
        newDish.stopId = routeResponseStops?.cityId ?? ""
        newDish.cafeId = cafeResponse?.id ?? ""
        newDish.dish = cafeResponse?.positions[indexPath.row]
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate 
        appDelegate.dishesList?.append(newDish)
        NotificationCenter.default.post(name: .updateCart, object: nil)
        print(appDelegate.dishesList?.count ?? "0" )
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "openMenu" {
//            if let destinationVC = segue.destination as? MenuViewController {
//                destinationVC.routeResponseStops = cafeResponse
//            }
//        }
//    }
}

// MARK: - CartButton logic

extension MenuViewController {
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
