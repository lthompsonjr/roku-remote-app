//
//  ResponseDelegate.swift
//  RokuRemoteApp
//
//  Created by Thuringer, Nicholas (Associate Software Developer) on 16/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation

/*  Response Delegate used to handle HTTP responses.
    The completion handler of an http request will call the didReceiveResponse
    function and pass it the data in the response.
 */
public protocol ResponseDelegate
{
    func didReceiveResponse(data: NSData)
    
    // Used for the getDeviceInfo function, which will return an XML with the info.
    func didReceiveXMLInfo(data: NSData)
}