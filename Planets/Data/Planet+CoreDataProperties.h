//
//  Planet+CoreDataProperties.h
//  Planets
//
//  Created by iRohan on 09/01/19.
//  Copyright © 2019 satyamraikar17. All rights reserved.
//
//

#import "Planet+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Planet (CoreDataProperties)

+ (NSFetchRequest<Planet *> *)fetchRequest;
- (void)populatePlanetsWithDictionary:(NSDictionary *)dict;

@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
