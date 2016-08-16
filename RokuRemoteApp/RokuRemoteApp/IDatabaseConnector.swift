//
//  File.swift
//  RokuRemoteApp
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation
protocol IDatabaseConnector
{
    func getRokuObject() -> RokuObject
    
    func saveRokuObject(rokuObject: RokuObject)
}