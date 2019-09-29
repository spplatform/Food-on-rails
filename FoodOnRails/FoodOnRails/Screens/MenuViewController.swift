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
    
    @IBOutlet var tableView: UITableView!
    
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
//        cafeResponse = self.routeResponseStops?.cafes[indexPath.row]
//        self.performSegue(withIdentifier: "openMenu", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "openMenu" {
//            if let destinationVC = segue.destination as? MenuViewController {
//                destinationVC.routeResponseStops = cafeResponse
//            }
//        }
//    }
}
