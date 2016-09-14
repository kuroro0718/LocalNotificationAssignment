//
//  ViewController.swift
//  LocalNotificationAssignment
//
//  Created by ycliang on 2016/9/12.
//  Copyright © 2016年 Alex Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dateComponets = getDateComponets()
        dateComponets.year = 2016
        dateComponets.hour = 20
        dateComponets.minute = 25
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let localNotification = UILocalNotification()
        
        // Push notification at 3 AM
        localNotification.fireDate = calendar?.dateFromComponents(dateComponets)
        localNotification.alertBody = "現在時間： 凌晨三點，來首好聽的歌曲吧"
        localNotification.soundName = "3oclock.caf"
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        let transferNotification = UILocalNotification()
        dateComponets.day = 1
        // Push notification 1st day of month
        transferNotification.fireDate = calendar?.dateFromComponents(dateComponets)
        transferNotification.alertBody = "記得匯錢給Peter"
        transferNotification.soundName = "3oclock.caf"
        
        UIApplication.sharedApplication().scheduleLocalNotification(transferNotification)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDateComponets() -> NSDateComponents {
        let currentDate = NSDate()
        let calender = NSCalendar.currentCalendar()
        
        return calender.components([.Month, .Day, .Hour, .Minute], fromDate: currentDate)
    }
}

