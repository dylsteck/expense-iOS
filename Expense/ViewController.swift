//
//  ViewController.swift
//  Expense
//
//  Created by Dylan Steck on 7/5/16.
//  Copyright © 2016 Dylan Steck. All rights reserved.
//

import UIKit
import DigitsKit

class ViewController: UIViewController {
    @IBOutlet weak var coolButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        coolButton.alpha = 0.0
        UIView.animateWithDuration(2.0) { 
            self.coolButton.alpha = 1.0
        }
//        UIView.animateWithDuration(<#T##duration: NSTimeInterval##NSTimeInterval#>, animations: <#T##() -> Void#>)
        // Do any additional setup after loading the view, typically from a nib.
        let authButton = DGTAuthenticateButton(authenticationCompletion: { (session: DGTSession?, error: NSError?) in
            if (session != nil) {
                // TODO: associate the session userID with your user model
                let message = "Phone number: \(session!.phoneNumber)"
                let alertController = UIAlertController(title: "You are logged in!", message: message, preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "Continue", style: .Default, handler: { action in
                    self.performSegueWithIdentifier("loginSegue", sender: self)}))
                self.presentViewController(alertController, animated: true, completion: .None)
            } else {
                NSLog("Authentication error: %@", error!.localizedDescription)
            }
        })
        authButton.center = self.view.center
        self.view.addSubview(authButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
