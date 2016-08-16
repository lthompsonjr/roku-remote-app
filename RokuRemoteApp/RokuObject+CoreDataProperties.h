//
//  RokuObject+CoreDataProperties.h
//  RokuRemoteApp
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 15/08/2016.
//  Copyright © 2016 Thuringer, Nicholas (Associate Software Developer). All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RokuObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface RokuObject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *ipAddress;
@property (nullable, nonatomic, retain) NSString *serialNumber;
@property (nullable, nonatomic, retain) NSString *boxName;
@property (nullable, nonatomic, retain) NSDate *lastTimeConnected;

@end

NS_ASSUME_NONNULL_END
