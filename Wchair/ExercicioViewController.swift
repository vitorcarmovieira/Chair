//
//  ExercicioViewController.swift
//  Wchair
//
//  Created by Vitor on 6/17/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit

class ExercicioViewController: UIViewController {
    
    var exercicio: Exercicio?
    
    @IBOutlet weak var iniciarButton: UIButton!
    @IBOutlet weak var cronometroLabel: UILabel!
    
    var startTime = NSTimeInterval()
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func iniciar(sender: AnyObject) {
        
        let nome = iniciarButton.titleLabel?.text
        
        if nome! == "Iniciar"{
            
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target:self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
            
            iniciarButton.setTitle("Parar", forState: UIControlState.Normal)
        } else{
            
            timer.invalidate()
            timer = NSTimer()
            
            var popViewController : PopUpViewControllerSwift = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6", bundle: nil)
            popViewController.title = "This is a popup view"
            popViewController.showInView(self.view, withImage: UIImage(named: "Hugby"), withMessage: "You just triggered a great popup window", animated: true)
        }
    }
    
    func updateTime() {
        
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        
        let minutes = UInt8(elapsedTime / 60.0)
        
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        
        let seconds = UInt8(elapsedTime)
        
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        
        cronometroLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
