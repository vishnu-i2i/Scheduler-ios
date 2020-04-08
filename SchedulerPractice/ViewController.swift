//
//  ViewController.swift
//  SchedulerPractice
//
//  Created by Vishnu on 4/8/20.
//  Copyright © 2020 ideas2it. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var subtitleText: UITextField!
    @IBOutlet weak var bodyText: UITextField!
    @IBOutlet weak var switchValue: UISegmentedControl!
    @IBOutlet weak var hourText: UITextField!
    @IBOutlet weak var minuteText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var repeatValue: UISwitch!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    var notificationController = PendingNotificationsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert], completionHandler: {granted, error in
            if granted {
                print("Yes")
            } else {
                print("No")
            }
        })
    }

    @IBAction func sendNotification(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = titleText.text!
        content.subtitle = subtitleText.text!
        content.body = bodyText.text!
        let trigger: UNNotificationTrigger
        
        // 2
        let imageName = "applelogo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
            
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        
        if switchValue.selectedSegmentIndex == 0 {
            var date = DateComponents()
            date.hour = Int(hourText.text!)
            date.minute = Int(minuteText.text!)
            date.second = Int(secondText.text!)
        
            trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: repeatValue.isOn)
        } else {
            let seconds = Double(secondText.text!)
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds!, repeats: repeatValue.isOn)
        }
        
        content.attachments = [attachment]
        
        // 3
        
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        print("000000s")
        
        // 4
        center.add(request, withCompletionHandler: nil)
    }
    
    @IBAction func switchSchedule(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            hourText.isHidden = true
            minuteText.isHidden = true
            hourLabel.isHidden = true
            minuteLabel.isHidden = true
        } else if sender.selectedSegmentIndex == 0 {
            hourText.isHidden = false
            minuteText.isHidden = false
            hourLabel.isHidden = false
            minuteLabel.isHidden = false
        }
    }
    
}

