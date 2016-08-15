//
//  URLSessionProtocol.swift
//  RokuRemoteApp
//
//  Created by Thuringer, Nicholas (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation

typealias DataTaskResult = (NSData?, NSURLResponse?, NSError?) -> Void

protocol URLSessionProtocol {
    
    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult)
        -> URLSessionDataTaskProtocol
    
}