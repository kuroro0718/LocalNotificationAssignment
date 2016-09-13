//
//  ViewController.swift
//  LocalNotificationAssignment
//
//  Created by ycliang on 2016/9/12.
//  Copyright © 2016年 Alex Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playMusicButtonPressed(sender: AnyObject) {
        let dateComponets = getDateComponets()
        
        if dateComponets.hour == 21 {
            let localNotification = UILocalNotification()
            // Push notification at 3:30 AM
            localNotification.fireDate = NSDate()
            localNotification.alertBody = "現在時間： 凌晨三點，來首好聽的歌曲吧"
            localNotification.soundName = "3oclock.caf"
            
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        }
    }
    
    @IBAction func transferButtonPressed(sender: AnyObject) {
        let dateComponets = getDateComponets()
        
        if dateComponets.day == 1 {
            let localNotification = UILocalNotification()
            // Push notification 1st day of month
            localNotification.fireDate = NSDate()
            localNotification.alertBody = "記得匯錢給Peter"
            localNotification.soundName = "3oclock.caf"
            
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        }
    }
    
    func getDateComponets() -> NSDateComponents {
        let currentDate = NSDate()
        let calender = NSCalendar.currentCalendar()
        
        return calender.components([.Month, .Day, .Hour], fromDate: currentDate)
    }
}

