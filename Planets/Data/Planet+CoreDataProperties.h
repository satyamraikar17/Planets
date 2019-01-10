#import "Planet+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Planet (CoreDataProperties)

+ (NSFetchRequest<Planet *> *)fetchRequest;

/*!
 @brief Populates Planet NSManagedObject with NSDictionary values
 @param dict NSDictionary representation of a Planet
*/
- (void)populatePlanetsWithDictionary:(NSDictionary *)dict;

@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
