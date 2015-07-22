//
//  MailViewController.swift
//  CustomWebView
//
//  Created by vichhai on 6/29/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class MailViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        print("URL is \(URL)")
        performSegueWithIdentifier("gotowebview", sender:URL)
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotowebview" {
            let view1 : WebViewViewController = segue.destinationViewController as! WebViewViewController
            view1.receiveData = sender
        }
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
