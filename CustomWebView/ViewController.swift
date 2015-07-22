//
//  ViewController.swift
//  CustomWebView
//
//  Created by vichhai on 6/29/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var stop: UIBarButtonItem!
    @IBOutlet weak var refresh: UIBarButtonItem!
    @IBOutlet weak var forward: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(myWebView.isKindOfClass(UIWebView.classForCoder()),"webview outlet error")
        
        // Do any additional setup after loading the view, typically from a nib.
        loadRequestWithURL("http://facebook.com")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    internal func loadRequestWithURL(strURL : String) {
        
        let url = NSURL(string: strURL)
        let urlRequest = NSURLRequest(URL: url!)
        myWebView.loadRequest(urlRequest)
    }
    
    func updateButton() {
        forward.enabled = myWebView.canGoForward
        back.enabled    = myWebView.canGoBack
        stop.enabled    = myWebView.loading
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        updateButton()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        updateButton()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        updateButton()
    }
    
    
}

