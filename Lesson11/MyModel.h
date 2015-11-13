//
//  MyModel.h
//  Lesson11
//
//  Created by Azat Almeev on 13.11.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject
@property (nonatomic, strong) NSNumber *num;
@property (nonatomic, readonly) NSNumber *x2;
@property (nonatomic, readonly) NSNumber *x4;
@end
