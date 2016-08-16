//
//  stubDatabaseConnector.swift
//  RokuRemoteApp
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//

import Foundation

class StubDatabaseConnector: IDatabaseConnector {
    
    var rokuObject: RokuObject!
    
    init()
    {
        rokuObject = RokuObject()
    }
    
    func getRokuObject() -> RokuObject
    {
        return rokuObject
    }
    
    func saveRokuObject(rokuObject: RokuObject)
    {
        self.rokuObject = rokuObject
        
    }
    
    
}