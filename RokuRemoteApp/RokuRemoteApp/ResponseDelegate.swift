//
//  ResponseDelegate.swift
//  RokuRemoteApp
//
//  Created by Thuringer, Nicholas (Associate Software Developer) on 16/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation

public protocol ResponseDelegate
{
    func didReceiveResponse(data: NSData)
    
    func didReceiveXMLInfo(data: NSData)
}