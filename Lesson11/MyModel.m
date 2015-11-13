//
//  MyModel.m
//  Lesson11
//
//  Created by Azat Almeev on 13.11.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

+ (NSSet *)keyPathsForValuesAffectingX2 {
    return [NSSet setWithObject:@"num"];
}

- (NSNumber *)x4 {
    return @([self.x2 integerValue] * 2);
}

- (NSNumber *)x2 {
    return @([self.num integerValue] * 2);
}

- (void)setNum:(NSNumber *)num {
//    if ([num integerValue] > 100) {
    [self willChangeValueForKey:@"x4"];
    _num = num;
    [self didChangeValueForKey:@"x4"];
//    }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    NSLog(@"%@", key);
    return [super automaticallyNotifiesObserversForKey:key];
}

//+ (BOOL)automaticallyNotifiesObserversOfNum {
//    return NO;
//}

@end
