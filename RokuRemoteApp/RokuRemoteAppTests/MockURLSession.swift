//
//  MockURLSession.swift
//  RokuRemoteApp
//
//  Created by Thuringer, Nicholas (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation


class MockURLSession: URLSessionProtocol {
    var nextDataTask = MockURLSessionDataTask()
    private (set) var lastURL: NSURL?
    
    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult)
        -> URLSessionDataTaskProtocol
    {
        lastURL = url
        return nextDataTask
    }
}