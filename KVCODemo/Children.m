//
//  Children.m
//  KVCODemo
//
//  Created by Gabriel Theodoropoulos on 8/9/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "Children.h"

@implementation Children

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
        
        self.siblings = [[NSMutableArray alloc] init];
        
        self.cousins = [[KVCMutableArray alloc] init];
    }
    return self;
}

/*
+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    else{
        return [super automaticallyNotifiesObserversForKey:key];
    }
}
*/

/*
-(void)setName:(NSString *)name{
    [self willChangeValueForKey:@"name"];
    _name = name;
    [self didChangeValueForKey:@"name"];
}
*/


-(NSUInteger)countOfSiblings{
    return self.siblings.count;
}


-(id)objectInSiblingsAtIndex:(NSUInteger)index{
    return [self.siblings objectAtIndex:index];
}


-(void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index{
    [self.siblings insertObject:object atIndex:index];
}


-(void)removeObjectFromSiblingsAtIndex:(NSUInteger)index{
    [self.siblings removeObjectAtIndex:index];
}


@end
