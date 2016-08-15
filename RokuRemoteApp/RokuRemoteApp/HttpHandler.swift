//
//  HttpHandler.swift
//  RokuRemoteApp
//
//  Created by Thuringer, Nicholas (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation


public class HttpHandler
{
    
    let deviceInfoPath: String = "/query/device-info"
    var url: String!
    
    init(url: String)
    {
        self.url = url
    }
    
    public func callGetInfoEndPoint()
    {
        let tempUrl = self.url + self.deviceInfoPath
        print(url);
        let request = NSMutableURLRequest(URL: NSURL(string:tempUrl)!)
        let session = NSURLSession.sharedSession()
        
        request.HTTPMethod = "GET"
        let _: NSError?
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, err -> Void in
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(String(strData))
            //self.responseDelegate.didReceiveXMLInfo((strData?.dataUsingEncoding(NSUTF8StringEncoding))!)
        })
        
        task.resume()
    }
    
}