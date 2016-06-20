//
//  KVCMutableArray.m
//  KVCODemo
//
//  Created by Gabriel Theodoropoulos on 8/9/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "KVCMutableArray.h"

@implementation KVCMutableArray

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}


-(NSUInteger)countOfArray{
    return self.array.count;
}


-(id)objectInArrayAtIndex:(NSUInteger)index{
    return [self.array objectAtIndex:index];
}


-(void)insertObject:(id)object inArrayAtIndex:(NSUInteger)index{
    [self.array insertObject:object atIndex:index];
}


-(void)removeObjectFromArrayAtIndex:(NSUInteger)index{
    [self.array removeObjectAtIndex:index];
}
    

-(void)replaceObjectInArrayAtIndex:(NSUInteger)index withObject:(id)object{
    [self.array replaceObjectAtIndex:index withObject:object];
}

@end
