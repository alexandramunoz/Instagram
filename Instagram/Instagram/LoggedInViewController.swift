//
//  LoggedInViewController.swift
//  Instagram
//
//  Created by Alexandra Munoz on 2/20/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit
import Parse


class LoggedInViewController: UIViewController {

    @IBAction func onLogOut(sender: AnyObject) {
        PFUser.logOut()
        view.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
