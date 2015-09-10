//
//  ViewController.swift
//  deploygate-ios-sdk-swift-sample
//
//  Created by kenta.imai on 2015/08/31.
//  Copyright (c) 2015年 DeployGate. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet var tableView: UITableView!

    let authorize = "Authorize"
    let sdkVersion = "SDK Version"

    var dataSourceKey: [String] = []
    var dataSource = Dictionary<String,String>()

    override func viewDidLoad() {
        super.viewDidLoad()

        DGSLogv("%@", getVaList(["DGLog test message"]))

        tableView.delegate = self
        tableView.dataSource = self

        dataSourceKey = [authorize, sdkVersion]
        dataSource = [authorize: "", sdkVersion: DeployGateSDK.version()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceKey.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")

        cell.textLabel?.text = dataSourceKey[indexPath.row]
        cell.detailTextLabel?.text = dataSource[dataSourceKey[indexPath.row]]
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell!.textLabel!.text! == authorize {
            DeployGateSDK.sharedInstance().userAuthorizationWithCompletionHandler({ (authorized, error) -> Void in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let alert:UIAlertController = UIAlertController(title: "Authorize", message: authorized ? "Success" : "Failed", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                })
            })
        }
        cell?.selected = false
    }

}
