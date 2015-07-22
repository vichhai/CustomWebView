//
//  WebViewViewController.swift
//  CustomWebView
//
//  Created by vichhai on 6/29/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController,UIWebViewDelegate {

    var receiveData : AnyObject?
    

    @IBOutlet weak var myWebView: UIWebView!
   
    lazy var rightButton1: UIBarButtonItem = {
        var btn = UIButton(frame: CGRectMake(0, 0, 40, 44))
        btn.setBackgroundImage(UIImage(named: "close_link_icon"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "webViewClose:", forControlEvents: UIControlEvents.TouchUpInside)

        var right : UIBarButtonItem = UIBarButtonItem(customView: btn)
        return right
        }()
    
    lazy var rightButton2 : UIBarButtonItem = {
        var btn = UIButton(frame: CGRectMake(0, 0, 40, 44))
        btn.setBackgroundImage(UIImage(named: "share_icon.png"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "webViewShare:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var right : UIBarButtonItem = UIBarButtonItem(customView: btn)
        return right
    }()
    
    lazy var leftButton : UIBarButtonItem = {
        var btn  : UIButton = UIButton(frame: CGRectMake(0, 0, 34, 44))
        btn.setBackgroundImage(UIImage(named: "back_arrow_icon"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "webViewback:", forControlEvents: UIControlEvents.TouchUpInside)
        
        var left : UIBarButtonItem = UIBarButtonItem(customView: btn)
        return left
        
    }()
    
    lazy var leftLabel : UIBarButtonItem = {
        var myview : UIView = UIView(frame: CGRectMake(0, 0,203.0, 34.0))
        
        var label : UILabel = UILabel(frame: CGRectMake(0,0, 203.0, 34.0))
        label.font = UIFont.systemFontOfSize(12.5)
        label.tag  = 2000

        myview.addSubview(label)
        
        var left : UIBarButtonItem = UIBarButtonItem(customView: myview)
        
        return left
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadRequestWithURL(receiveData as! NSURL)
        var btnArray = [rightButton1,rightButton2]
        navigationItem.rightBarButtonItems = btnArray
        navigationItem.leftBarButtonItem = leftLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadRequestWithURL (URL : NSURL) {
        let requestURL = NSURLRequest(URL: URL)
        myWebView.loadRequest(requestURL)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        print(myWebView.canGoBack)
        
        if myWebView.canGoBack == true {
            navigationItem.leftBarButtonItems = nil
            navigationItem.leftBarButtonItems = [leftButton,leftLabel]
        } else {
            navigationItem.leftBarButtonItems = nil
            navigationItem.leftBarButtonItem  = leftLabel
        }
        return true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false

    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false

    }

    func webViewback(sender : AnyObject) {
        myWebView.goBack()
    }
    
    func webViewClose(sender : AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func webViewShare(sender : AnyObject) {
        
    }
}
