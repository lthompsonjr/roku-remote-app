//
//  ViewController.swift
//  RokuRemoteApp
//
//  Created by Thuringer, Nicholas (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import UIKit

class ViewController: UIViewController, ResponseDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let httpHandlerTest: HttpHandler = HttpHandler(url: "http://192.168.2.4:8060")
        httpHandlerTest.callGetInfoEndPoint(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didReceiveResponse(data: NSData) {
        
    }
    
    func didReceiveXMLInfo(data: NSData) {
        
    }
    
}

