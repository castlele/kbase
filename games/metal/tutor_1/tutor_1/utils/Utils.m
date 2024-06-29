#import "Utils.h"

NSArray *map(NSArray *arr, id(^block)(id))
{
    NSMutableArray *result = [[NSMutableArray alloc] init];

    for (id obj in arr)
         [result addObject:block(obj)];

    return result;
}
