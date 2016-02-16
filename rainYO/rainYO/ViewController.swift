//
//  ViewController.swift
//  rainYO
//
//  Created by Yuki Yoshioka on 2016/02/16.
//  Copyright © 2016年 Yuki Yoshioka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDelegate {

    @IBOutlet weak var yoAcount: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var autobtn: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pushrainYO(sender: AnyObject) {
        
        let url = NSURL(string: "http://api.justyo.co/yo/")
        //let url = NSURL(string: "http://api.justyo.co/yo/")
        
        // postdata
        let postString = "api_token=" + "67f23c6a-4deb-44b7-a75a-52cd5616b4f3" + "&username=" + yoAcount.text!
        let dataString = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        
        // connection
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let req = NSMutableURLRequest(URL: url!)
        req.HTTPMethod = "POST"
        req.HTTPBody = dataString
        let task = session.dataTaskWithRequest(req, completionHandler: { data, response, error in
            if (error == nil) {
                let result = NSString(data: data!, encoding: NSUTF8StringEncoding)!
                print(result)
            } else {
                print(error)
            }
        })
        task.resume()
    }


}

