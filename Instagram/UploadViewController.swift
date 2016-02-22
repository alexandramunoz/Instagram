//
//  UploadViewController.swift
//  Instagram
//
//  Created by Alexandra Munoz on 2/20/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let vc = UIImagePickerController()
    
    @IBOutlet weak var chosenImageView: UIImageView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var captionField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.delegate = self
        vc.allowsEditing = true
        chosenImageView.hidden = true
        captionField.hidden = true
        postButton.hidden = true
    
    
        // Do any additional setup after loading the view.
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func onChooseImage(sender: AnyObject) {
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
        
        chosenImageView.hidden = false
        
            
        captionField.hidden = false
        
        postButton.hidden = false
    }
   
    
    @IBAction func onPost(sender: UIButton) {
        let caption = captionField.text
        UserMedia.postUserImage(chosenImageView.image, withCaption: caption) { (success: Bool, error: NSError?) -> Void in
            print("posted!")
        }
    }
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            //let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            vc.dismissViewControllerAnimated(true) { () -> Void in
            
            self.chosenImageView.image = editedImage
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
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
