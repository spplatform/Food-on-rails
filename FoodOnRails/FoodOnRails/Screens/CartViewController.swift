//
//  CartViewController.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/28/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var payButton: UIButton!
    
    var cafeResponse: CafeResponse?
    var routeResponseStops: RouteResponseStops?
    var routeRespone: RouteResponse?
    
    var stopId = ""
    var cafeId = ""
    var dish:CafeDishResponse?
    
    var cart = [DishInCart]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        payButton.layer.masksToBounds = true
        payButton.layer.cornerRadius = 5
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let dishes = appDelegate.dishesList {
            cart = dishes
        }
        let customImageBarBtn2 = UIBarButtonItem(
            image: UIImage(named: "btnCart.png")?.withRenderingMode(.alwaysOriginal),
        style: .plain, target: self, action: #selector(handleCarttTap))
        navigationItem.rightBarButtonItems = [customImageBarBtn2]
    }
    
    @objc func handleCarttTap() {
        self.performSegue(withIdentifier: "openCart", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.dishName.text = cart[indexPath.row].dish?.name ?? ""
        cell.price.text = String((cart[indexPath.row].dish?.price ?? 0)/100) + " ₽"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        var newDish = DishInCart()
//        newDish.stopId = routeResponseStops?.cityId ?? ""
//        newDish.cafeId = cafeResponse?.id ?? ""
//        newDish.dish = cafeResponse?.positions[indexPath.row]
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.dishesList?.append(newDish)
//        print(appDelegate.dishesList?.count ?? "0" )
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "openMenu" {
//            if let destinationVC = segue.destination as? MenuViewController {
//                destinationVC.routeResponseStops = cafeResponse
//            }
//        }
//    }
}
