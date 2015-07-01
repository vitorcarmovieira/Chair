//
//  PerfilViewController.swift
//  Wchair
//
//  Created by Rodrigo Conte on 15/06/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit
import CoreData
import Social

class PerfilViewController: UIViewController, FBSDKLoginButtonDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var NewAvatar: UIImage?
    var shareSS: UIImage?
    var item: AnyObject?
    var picker:UIImagePickerController?=UIImagePickerController()
    var popover:UIPopoverController?=nil
    
     @IBOutlet weak var LbName: UILabel!
     @IBOutlet weak var IVPhoto: UIImageView!
     @IBOutlet weak var LbPratica: UILabel!
     @IBOutlet weak var MaxLim: UILabel!
     @IBOutlet weak var FBButom: FBSDKLoginButton!
     @IBAction func FBDatasBT(sender: AnyObject) {
        
        var FirstName: String!
        var LastName: String!
        
        }
    
/**------------------------------------------------------------------------------**/
    
    @IBOutlet weak var BtShare: UIButton!
    @IBAction func ShareFacebook(sender: AnyObject) {
        
        self.screenShotMethod()
        self.socialShare(sharingText: "Meu desempenho em atividades fisicas!", sharingImage: (self.shareSS))
        
    }
    
/**------------------------------------------------------------------------------**/
    
    func socialShare(#sharingText: String?, sharingImage: UIImage?) {
        var sharingItems = [AnyObject]()
        
        if let text = sharingText {
            sharingItems.append(text)
        }
        if let image = sharingImage {
            sharingItems.append(image)
        }
        
        let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityTypeCopyToPasteboard,UIActivityTypeAirDrop,UIActivityTypeAddToReadingList,UIActivityTypeAssignToContact,UIActivityTypePostToTencentWeibo,UIActivityTypePostToVimeo,UIActivityTypePrint,UIActivityTypeSaveToCameraRoll,UIActivityTypePostToWeibo]
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    func screenShotMethod() {
        
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext())
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.shareSS = UIImage(named: "Graphic");
        //Save it to the camera roll
        //println("Salvou print na galeria")
        //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        
    }
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
        {
            picker!.sourceType = UIImagePickerControllerSourceType.Camera
            self .presentViewController(picker!, animated: true, completion: nil)
        }
        else
        {
            openGallary()
        }
    }
    
    func openGallary()
    {
        picker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(picker!, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: picker!)
            popover!.presentPopoverFromRect(BtCamera.frame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        }
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        picker.dismissViewControllerAnimated(true, completion: nil)
        //ImageUtil.cropToSquare(image: info[UIImagePickerControllerOriginalImage] as! UIImage)
        
        IVPhoto.image=(info[UIImagePickerControllerOriginalImage] as! UIImage)
        self.NewAvatar = (info[UIImagePickerControllerOriginalImage] as! UIImage)
        //sets the selected image to image view
    }
    
/**------------------------------------------------------------------------------**/
    
    @IBOutlet weak var BtCamera: UIButton!
    @IBAction func CameraAcess(sender: AnyObject) {
        
        var alert:UIAlertController=UIAlertController(title: "Alterar imagem de perfil", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default)
            {
                UIAlertAction in
                self.openCamera()
                
        }
        var gallaryAction = UIAlertAction(title: "Galeria", style: UIAlertActionStyle.Default)
            {
                UIAlertAction in
                self.openGallary()
        }
        var cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Cancel)
            {
                UIAlertAction in
                
        }
        
        picker!.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: alert)
            popover!.presentPopoverFromRect(BtCamera.frame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        }

    }
    
/**------------------------------------------------------------------------------**/
    
    @IBOutlet weak var AllGraficos: UISegmentedControl!
    @IBAction func SegmentControl(sender: UISegmentedControl) {
        
        switch AllGraficos.selectedSegmentIndex{
        case 0:
            LbPratica.text = "Geral"
        case 1:
            LbPratica.text = "Basquete"
        case 2:
            LbPratica.text = "Esgrima"
            
        default: NSLog("Invalid Input")
        }
        
        
    }
    
 /**------------------------------------------------------------------------------**/
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LbName.text = "UserName"
        IVPhoto.image = UIImage(named: "Assets Perfil-70")
        
        LbPratica.text = "Geral"
        LbName.text = "UserName"
        
 /**------------------------------------------------------------------------------**/
    
        IVPhoto.layer.borderWidth = 6.0
        IVPhoto.layer.masksToBounds = false
        IVPhoto.layer.borderColor = UIColor(red: 0.69, green: 0.84, blue: 0.18, alpha: 1.0).CGColor
        IVPhoto.layer.cornerRadius = IVPhoto.frame.size.width/2
        IVPhoto.clipsToBounds = true
        
        FBButom.layer.borderWidth = 0.0
        FBButom.layer.masksToBounds = false
        FBButom.layer.cornerRadius = FBButom.frame.size.width/2
        FBButom.clipsToBounds = true
        
        BtShare.layer.borderWidth = 0.0
        BtShare.layer.masksToBounds = false
        BtShare.layer.cornerRadius = BtShare.frame.size.width/2
        BtShare.clipsToBounds = true
        
        BtCamera.layer.borderWidth = 0.0
        BtCamera.layer.masksToBounds = false
        BtCamera.layer.cornerRadius = BtCamera.frame.size.width/2
        BtCamera.clipsToBounds = true
        
 /**------------------------------------------------------------------------------**/
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            let fetchRequest = NSFetchRequest(entityName: "Usuario")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Usuario] {
                
                LbName.text = fetchResults[0].nome
                IVPhoto.image = UIImage(data: fetchResults[0].avatar)

            }
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
                            
                            self.LbName.text = _name
                            self.IVPhoto.image = UIImage(data: image)

                        }

                    }
        
                })
                
            }else{
                
                NSLog("Erro Image %@",error!.localizedDescription)
                
            }
        }
    }
    
 /**---------------------------------------------------------------------------**/
    
    func save() {
        var error : NSError?
        if(managedObjectContext!.save(&error) ) {
            println(error?.localizedDescription)
        }
    }
    
   func updateUserAvatar(){
//    
//        let fetchRequest = NSFetchRequest(entityName: "Usuario")
//        fetchRequest.predicate = NSPredicate(format: "avatar == %@", NewAvatar!)
//        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as?
//            [Usuario]{
//                NewAvatar = fetchResults
//                println("Mudou")
//        }
    
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


