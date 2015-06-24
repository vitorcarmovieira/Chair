//
//  PerfilViewController.swift
//  Wchair
//
//  Created by Rodrigo Conte on 15/06/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit
import CoreData

var cont=0

class PerfilViewController: UIViewController, FBSDKLoginButtonDelegate {

    var item: AnyObject?
     @IBOutlet weak var LbName: UILabel!
     @IBOutlet weak var IVPhoto: UIImageView!
     @IBOutlet weak var LbPratica: UILabel!
     @IBOutlet weak var MaxLim: UILabel!
     @IBOutlet weak var FBButom: FBSDKLoginButton!
     @IBAction func FBDatasBT(sender: AnyObject) {
        
        var FirstName: String!
        var LastName: String!
        
        }
    
    @IBOutlet weak var AllGraficos: UISegmentedControl!
    
    
    
    @IBAction func SegmentControl(sender: UISegmentedControl) {
        
        switch AllGraficos.selectedSegmentIndex{
        case 0:
            LbPratica.text = "Geral"
        case 1:
            LbPratica.text = "Especifico 1"
        case 2:
            LbPratica.text = "Especifico 2"
            
        default: NSLog("Invalid Input")
        }
        
        
    }
    
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LbName.text = "UserName"
        IVPhoto.image = UIImage(named: "teste")
        
        LbPratica.text = "Geral"
        //let user = self.item as! Usuario
        LbName.text = "UserName"
//        IVPhoto.image = UIImage(data: user.avatar)
        
/**------------------------------------------------------------------------------**/
    
        
            let fetchRequest = NSFetchRequest(entityName: "Usuario")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Usuario] {
                LbName.text = fetchResults[0].nome
                IVPhoto.image = UIImage(data: fetchResults[0].avatar)
                }
        

        
 /**------------------------------------------------------------------------------**/
        
        //IVPhoto.image = UIImage(named: "teste");
        //IVPhoto = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width * 0.19 , self.view.bounds.height * 0.1))
        IVPhoto.layer.borderWidth = 7.0
        IVPhoto.layer.masksToBounds = false
        IVPhoto.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).CGColor
        IVPhoto.layer.cornerRadius = IVPhoto.frame.size.width/2
        IVPhoto.clipsToBounds = true
        
 /**------------------------------------------------------------------------------**/
        
        FBButom.layer.borderWidth = 0.0
        FBButom.layer.masksToBounds = false
        FBButom.layer.cornerRadius = FBButom.frame.size.width/2
        FBButom.clipsToBounds = true
        
 /**------------------------------------------------------------------------------**/
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
        }
        
    }
    
    
    
    /**-----------------------------FACEBOOK INFO-----------------------------**/
    
    func getFacebookDatas(){
        
        let url = NSURL(string: "https://graph.facebook.com/" + FBSDKAccessToken.currentAccessToken().userID + "/picture?type=large" )
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            
            if error == nil{
                
                var image = data
                
                var graphReq: FBSDKGraphRequest =  FBSDKGraphRequest(graphPath: "me", parameters: nil)
                
                
                graphReq.startWithCompletionHandler({
                    
                    
                    
                    (connection,result,error: NSError?) -> Void in
                    
                    
                    
                    if error != nil {
                        
                        NSLog("Erro GraphReq %@",error!.localizedDescription)
                        
                    }else{
                        
                        var _facebookId = result["id"] as! String
                        
                        var _name = result["name"] as! String
                    
                        if let moc = self.managedObjectContext{
                        Usuario.createInManagedObjectContext(moc, avatar: image, email: "N/A", nome: _name, senha: "N/A")
    
                            self.save()
                            //return cont = 1;
                            
                        //self.cadastrar(name: _name, facebookID: _facebookId, photo: image)
                        }

                    }
        
                })
                
            }else{
                
                NSLog("Erro Image %@",error!.localizedDescription)
                
            }
        }
    }
    
    func save() {
        var error : NSError?
        if(managedObjectContext!.save(&error) ) {
            println(error?.localizedDescription)
        }
    }
    
  /**---------------------------------------------------------------------------**/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        println("User Logged In")
        self.getFacebookDatas()
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                println("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                println("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                println("User Email is: \(userEmail)")
            }
        })
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
