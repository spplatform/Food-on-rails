//
//  RouteViewController.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/28/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var routeRespone: RouteResponse?
    var selectedRouteResponseStops: RouteResponseStops?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let customImageBarBtn1 = UIBarButtonItem(
            image: UIImage(named: "btnTicket.png")?.withRenderingMode(.alwaysOriginal),
        style: .plain, target: self, action: #selector(handleTicketTap))
        navigationItem.leftBarButtonItems = [customImageBarBtn1]
        
        let customImageBarBtn2 = UIBarButtonItem(
            image: UIImage(named: "btnCart.png")?.withRenderingMode(.alwaysOriginal),
        style: .plain, target: self, action: #selector(handleCarttTap))
        navigationItem.rightBarButtonItems = [customImageBarBtn2]
    }
    
    
    @objc func handleTicketTap() {
        self.performSegue(withIdentifier: "openTicket", sender: self)
    }
    
    @objc func handleCarttTap() {
        self.performSegue(withIdentifier: "openCart", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routeRespone?.stops.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "RouteTableViewCell", for: indexPath) as! RouteTableViewCell
        cell.stationName.text = self.routeRespone?.stops[indexPath.row].name ?? ""
        
        let date = Date()
        if let arriveDat = self.routeRespone?.stops[indexPath.row].dateTime {
            let cal = Calendar.current
            
            let d1 = Date()
            let components = cal.dateComponents([.hour], from: d1, to: arriveDat)
            let diffHour = components.hour ?? 0
            let diffMinute = components.minute ?? 0
            
            cell.timerValue.text = String(diffHour) + ":" + String(diffMinute)
        }
        
        //cell.timerValue.text = String((self.routeRespone?.stops[indexPath.row].duration ?? 0)/60) + " мин"
        cell.arriveTime.text = (self.routeRespone?.stops[indexPath.row].dateTime.string(with: "dd HH:mm") ?? "") + " " + String((self.routeRespone?.stops[indexPath.row].duration ?? 0)/60) + " мин"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRouteResponseStops = self.routeRespone?.stops[indexPath.row]
        self.performSegue(withIdentifier: "openStation", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openStation" {
            if let destinationVC = segue.destination as? StationViewController {
                destinationVC.routeResponseStops = selectedRouteResponseStops
            }
        }
    }
}

extension Date {
    func string(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
