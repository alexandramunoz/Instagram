//
//  LoggedInViewController.swift
//  Instagram
//
//  Created by Alexandra Munoz on 2/20/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit
import Parse


class LoggedInViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userFeed: [PFObject]?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func onLogOut(sender: AnyObject) {
        PFUser.logOut()
        view.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20

        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                self.userFeed = media
                // do something with the data fetched
                self.tableView.reloadData()
            } else {
                // handle error
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let userFeed = userFeed {
            return userFeed.count
        } else{
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedCell", forIndexPath: indexPath) as! FeedTableViewCell
        
        let post = self.userFeed![indexPath.row]
        
        let postedImageView = post["media"] as! PFFile
        
        postedImageView.getDataInBackgroundWithBlock{(imageData: NSData?, error: NSError?) -> Void in
            if let error = error{
                print(error)
            }
            if error == nil{
                let image = UIImage(data:imageData!)
                cell.postedImageView.image = image
                print("image loaded")
            }
            
        }
        
   //let time = post["time"] as! Double
    //cell.timeLabel.text = String("\(time)")
        
        
        let username = post["author"] as! PFUser
        
        cell.nameLabel.text = post["author"].username
        
        let caption = post["caption"] as! String
        
        cell.postedLabel.text = caption
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.blueColor()
        cell.selectedBackgroundView = backgroundView
        
         return cell
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
