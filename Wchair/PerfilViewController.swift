//
//  PerfilViewController.swift
//  Wchair
//
//  Created by Rodrigo Conte on 15/06/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {

     @IBOutlet weak var LbName: UILabel!
     @IBOutlet weak var IVPhoto: UIImageView!
     @IBOutlet weak var LbPratica: UILabel!
     @IBOutlet weak var MaxLim: UILabel!
    
//    iv = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width * 0.19 , self.view.bounds.height * 0.1))
//    profilepic.layer.borderWidth = 1
//    profilepic.layer.masksToBounds = false
//    profilepic.layer.borderColor = UIColor.blackColor().CGColor
//    profilepic.layer.cornerRadius = profilepic.frame.height/2
//    profilepic.clipsToBounds = true
//    slider.addSubview(profilepic)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LbName.text = "Rocontrex";
        
        IVPhoto.image = UIImage(named: "teste");
        //IVPhoto = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width * 0.19 , self.view.bounds.height * 0.1))
        IVPhoto.layer.borderWidth = 7.0
        IVPhoto.layer.masksToBounds = false
        IVPhoto.layer.borderColor = UIColor(red: 0.42, green: 0.66, blue: 0.31, alpha: 1.0).CGColor
        IVPhoto.layer.cornerRadius = IVPhoto.frame.size.width/2
        IVPhoto.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func CameraPerfil(sender: AnyObject) {
        
        
        
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
