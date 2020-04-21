//
//  FirstViewController.swift
//  TravelAppPractice
//
//  Created by Vishnu on 4/17/20.
//  Copyright © 2020 ideas2it. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var tours: [Tour] = [Tour(text: "Greece", image: "Greece"), Tour(text: "United States", image: "UnitedStates")]
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tour", for: indexPath)
            as! ToursTableViewCell
        cell.countryName!.text = tours[indexPath.row].text
        let items = try! fm.contentsOfDirectory(atPath: path)
        let imageName = tours[indexPath.row].image
        for item in items {
            if item.hasPrefix(imageName) {
                cell.imageField.image = UIImage(named: item)
            }
        }
        
        return cell
    }
    
    
}



