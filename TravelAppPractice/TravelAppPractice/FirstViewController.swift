//
//  FirstViewController.swift
//  TravelAppPractice
//
//  Created by Vishnu on 4/22/20.
//  Copyright © 2020 ideas2it. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let file = FileManager.default
    let path = Bundle.main.resourcePath!
    var tours: [Tour] = [Tour(name: "Greece", image: "Greece"), Tour(name: "United States", image: "UnitedStates"), Tour(name: "United Kingdom", image: "UnitedKingdom")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "ToursTableViewCell", bundle: nil), forCellReuseIdentifier: "Tour")
    }


}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tour", for: indexPath) as! ToursTableViewCell
        cell.countryName.text = tours[indexPath.row].name
        let items = try! file.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix(tours[indexPath.row].image) {
                cell.imageView?.image = UIImage(named: item)
            }
        }
        return cell
    }
    
    
}

