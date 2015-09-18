//
//  SendLogViewController.swift
//  deploygate-ios-sdk-swift-sample
//
//  Created by kenta.imai on 2015/08/31.
//  Copyright (c) 2015年 DeployGate. All rights reserved.
//

import UIKit

class SendLogViewController: UIViewController {
    @IBOutlet var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendLog(sender: AnyObject) {
        let text = textView.text
        textView.text = ""

        DGSLogv("%@", getVaList([text]))
        let alert:UIAlertController = UIAlertController(title: "DGSLog Done", message: "Require relaunch app", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Cancel, handler:nil))
        alert.addAction(UIAlertAction(title: "Relaunch",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction) -> Void in
                exit(0) // finish application
        }))
        presentViewController(alert, animated: true, completion: nil)
    }
}
