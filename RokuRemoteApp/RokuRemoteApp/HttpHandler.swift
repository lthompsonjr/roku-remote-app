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
//
//typealias HTTPResult = (NSData?, ErrorType?) -> Void
//
//public class HttpHandler
//{
//    
//    let deviceInfoPath: String = "/query/device-info"
//    var url: String!
//    var responseDelegate: HttpResponseDelegate!
//    private let session: URLSessionProtocol
//    
//    init(session: URLSessionProtocol = NSURLSession.sharedSession(), url: String)
//    {
//        self.session = session
//        self.url = url
//    }
//    
//    
//    public func callGetInfoEndPoint()
//    {
//        let tempUrl = self.url + self.deviceInfoPath
//        print(url);
//        let request = NSMutableURLRequest(URL: NSURL(string:tempUrl)!)
//        let session = NSURLSession.sharedSession()
//        
//        request.HTTPMethod = "GET"
//        let _: NSError?
//        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, err -> Void in
//            print("Response: \(response)")
//            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print(String(strData))
//            self.responseDelegate.didReceiveXMLInfo((strData?.dataUsingEncoding(NSUTF8StringEncoding))!)
//        })
//        
//        task.resume()
//    }
//    
//    func get(url: NSURL, completion: HTTPResult) {
//        let task = session.dataTaskWithURL(url) { (_, _, _) -> Void in }
//        task.resume()
//    }
//    
//}