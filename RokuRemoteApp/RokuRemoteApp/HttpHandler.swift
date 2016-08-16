//
//  HttpHandler.swift
//  RokuRemoteApp
//
//  Created by Thuringer, Nicholas (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation

//extension NSURLSessionDataTask: URLSessionDataTaskProtocol { }
//
//extension NSURLSession: URLSessionProtocol
//{
//    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult)
//        -> URLSessionDataTaskProtocol
//    {
//        return (dataTaskWithURL(url, completionHandler: completionHandler)
//            as NSURLSessionDataTask) as URLSessionDataTaskProtocol
//    }
//}

typealias HTTPResult = (NSData?, ErrorType?) -> Void

public class HttpHandler
{
    
    let deviceInfoPath: String = "/query/device-info"
    var url: String!
    
    init(url: String)
    {
        self.url = url
    }
    
    /*
    callGetInfoEndPoint
       Calls the ROKU endpoint that retrieves the ROKU device information in NSData format
       If the request is succesful it calls didReceiveXMLInfo passing an NSData containing the device info
    */
    public func callGetInfoEndPoint(delegate: ResponseDelegate)
    {
        let tempUrl = self.url + self.deviceInfoPath
        print(url)
        let request = NSMutableURLRequest(URL: NSURL(string:tempUrl)!)
        let session = NSURLSession.sharedSession()
        
        request.HTTPMethod = "GET"
        let _: NSError?
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, err -> Void in
            print("Response: \(response)")
            
            // Check that data is not nil
            if let responseData = data
            {
                delegate.didReceiveXMLInfo(data!)
            }
        })
        
        task.resume()
    }
    
    /*
     callButtonPressedEndPoint
        Calls the ROKU endpoint that parses the http request into a ROKU command.
        If the request is successful it calls didReceiveResponse method passing an NSData containing 200 OK
     */
    public func callButtonPressedEndPoint(operation: String, delegate: ResponseDelegate)
    {
        let tempUrl = self.url + operation
        print(url)
        
        let request = NSMutableURLRequest(URL: NSURL(string:tempUrl)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        let _: NSError?
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, err -> Void in
            print("Response: \(response)")
            
            if let responseData = data
            {
                delegate.didReceiveResponse(data!)
            }
        })
        
        task.resume()
    }

}