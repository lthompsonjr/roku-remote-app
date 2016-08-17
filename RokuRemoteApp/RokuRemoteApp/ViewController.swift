//
//  ViewController.swift
//  RokuRemoteApp
//
//  Created by Thuringer, Nicholas (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import UIKit

class ViewController: UIViewController, ResponseDelegate {
    
    var httpHandler: HttpHandler!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //move this into the call back function that returns an ip address
        httpHandler = HttpHandler(url: "http://192.168.2.4:8060")
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func buttonPressedUp(sender: AnyObject)
    {
        let buttonpressedUpURL = "/keypress/Up"
        httpHandler.buttonPressed(buttonpressedUpURL, delegate: self)
        
    }
    
    @IBAction func buttonPressedDown(sender: AnyObject)
    {
        let buttonpressedDownURL = "/keypress/Down"
        httpHandler.buttonPressed(buttonpressedDownURL, delegate: self)
    }
    
    @IBAction func buttonPressedLeft(sender: AnyObject)
    {
        let buttonpressedLeftURL = "/keypress/Left"
        httpHandler.buttonPressed(buttonpressedLeftURL, delegate: self)
    }
    
    @IBAction func buttonPressedRight(sender: AnyObject)
    {
        let buttonpressedRightURL = "/keypress/Right"
        httpHandler.buttonPressed(buttonpressedRightURL, delegate: self)
    }
    
    @IBAction func buttonPressedOK(sender: AnyObject)
    {
        let buttonpressedOkURL = "/keypress/Ok"
        httpHandler.buttonPressed(buttonpressedOkURL, delegate: self)
    }
    
    @IBAction func buttonPressedBack(sender: AnyObject)
    {
        let buttonpressedBackURL = "/keypress/Back"
        httpHandler.buttonPressed(buttonpressedBackURL, delegate: self)
    }
    
    @IBAction func buttonPressedHome(sender: AnyObject)
    {
        let buttonpressedHomeURL = "/keypress/Home"
        httpHandler.buttonPressed(buttonpressedHomeURL, delegate: self)
    }
    
    
    func didReceiveResponse(data: NSData)
    {
        
    }
    
    // Used for the getDeviceInfo function, which will return an XML with the info.
    func didReceiveXMLInfo(data: NSData)
    {
        
    }

    
    
}

