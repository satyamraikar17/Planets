//
//  Planet+CoreDataProperties.m
//  Planets
//
//  Created by iRohan on 09/01/19.
//  Copyright © 2019 satyamraikar17. All rights reserved.
//
//

#import "Planet+CoreDataProperties.h"

@implementation Planet (CoreDataProperties)

+ (NSFetchRequest<Planet *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Planet"];
}

@dynamic name;

- (void)populatePlanetsWithDictionary:(NSDictionary *)dict {
    NSDictionary *attributes = [[self entity] attributesByName];
    for (NSString *attribute in attributes) {
        id value = [dict objectForKey:attribute];
        if (value == nil) {
            continue;
        }
        
        NSAttributeType attributeType = [[attributes objectForKey:attribute] attributeType];
        if ((attributeType == NSStringAttributeType) && ([value isKindOfClass:[NSNumber class]])) {
            value = [value stringValue];
        } else if (((attributeType == NSInteger16AttributeType) || (attributeType == NSInteger32AttributeType) || (attributeType == NSInteger64AttributeType) || (attributeType == NSBooleanAttributeType)) && ([value isKindOfClass:[NSString class]])) {
            value = [NSNumber numberWithInteger:[value  integerValue]];
        } else if ((attributeType == NSFloatAttributeType) && ([value isKindOfClass:[NSString class]])) {
            value = [NSNumber numberWithDouble:[value doubleValue]];
        }
        [self setValue:value forKey:attribute];
    }
}

@end
