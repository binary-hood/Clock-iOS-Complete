//
//  ViewController.swift
//  Clock
//
//  Created by Binaryhood on 3/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hour: UIImageView!
    @IBOutlet weak var minute: UIImageView!
    @IBOutlet weak var second: UIImageView!
    
    var check:Bool = false
    var value:Int = 0
    
    func updateUI() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ (_) in
            
            let todayDate = Date()
            
            let currentHour = (Calendar.current.component(.hour, from: todayDate))
            let currentMin = (Calendar.current.component(.minute, from: todayDate))
            let currentSec = (Calendar.current.component(.second, from: todayDate))
            
            self.hour.image = UIImage(named: String(currentHour))
            self.minute.image = UIImage(named: String(currentMin))
            self.second.image = UIImage(named: String(currentSec))
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        
    }
    
    @objc func orientationChanged() {
        if UIDevice.current.orientation == .landscapeLeft {
            if(check == true){
                check = false
                hour.transform = hour.transform.rotated(by: CGFloat(Double.pi / 2)) // 90 degree
                minute.transform = minute.transform.rotated(by: CGFloat(Double.pi / 2)) // 90 degree
                second.transform = second.transform.rotated(by: CGFloat(Double.pi / 2)) // 90 degree
            }
        }else if UIDevice.current.orientation == .portrait {
            if(value < 1){
                value += 1
                check = true
            }else{
                check = true
                hour.transform = hour.transform.rotated(by: CGFloat(Double.pi / (-2) )) // reverse the rotation
                minute.transform = minute.transform.rotated(by: CGFloat(Double.pi / (-2) )) //  reverse the rotation
                second.transform = second.transform.rotated(by: CGFloat(Double.pi / (-2) )) //  reverse the rotation
            }
        }
        
        
    }
    
}

