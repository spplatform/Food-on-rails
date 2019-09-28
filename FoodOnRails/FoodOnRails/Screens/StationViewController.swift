//
//  StationViewController.swift
//  FoodOnRails
//
//  Created by Kirill Klebanov on 9/28/19.
//  Copyright © 2019 Hdmast. All rights reserved.
//

import UIKit

class StationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var routeResponseStops: RouteResponseStops?
    
    @IBOutlet var tableView: UITableView!
    
    var routeRespone: RouteResponse?
    var selectedRouteResponseStops: RouteResponseStops?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routeResponseStops?.cafes.count ?? 0
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//        switch tableView {
//        case self.tableView:
//            return /*routeRespone?.stops.count ??*/ 0
//        default:
//            return 0
//       }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CafeTableViewCell", for: indexPath) as! CafeTableViewCell
        if let station = routeResponseStops {
            cell.cafeName.text = station.cafes[indexPath.row].name
            cell.cafeName.text = station.cafes[indexPath.row].
        }
//        cell.stationName.text = self.routeRespone?.stops[indexPath.row].name ?? ""
//
//        let date = Date()
//        if let arriveDat = self.routeRespone?.stops[indexPath.row].dateTime {
//            let cal = Calendar.current
//
//            let d1 = Date()
//            let components = cal.dateComponents([.hour], from: d1, to: arriveDat)
//            let diffHour = components.hour ?? 0
//            let diffMinute = components.minute ?? 0
//
////            let interval = date.
////            let diffDate = arriveDat - date
//            cell.timerValue.text = String(diffHour) + ":" + String(diffMinute)
//        }
//
//        //cell.timerValue.text = String((self.routeRespone?.stops[indexPath.row].duration ?? 0)/60) + " мин"
//        cell.arriveTime.text = (self.routeRespone?.stops[indexPath.row].dateTime.string(with: "dd HH:mm") ?? "") + " " + String((self.routeRespone?.stops[indexPath.row].duration ?? 0)/60) + " мин"
        //cell.textLabel?.text = "adsf"//self.data[indexPath.row]
//        if indexPath.row == 0 {
//            cell.accessoryType = .disclosureIndicator
//        } else {
//            cell.accessoryType = .none
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRouteResponseStops = self.routeRespone?.stops[indexPath.row]
        self.performSegue(withIdentifier: "openMenu", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openMenu" {
            if let destinationVC = segue.destination as? StationViewController {
                destinationVC.routeResponseStops = selectedRouteResponseStops
            }
        }
    }
}

