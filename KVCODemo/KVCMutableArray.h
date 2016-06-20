//
//  KVCMutableArray.h
//  KVCODemo
//
//  Created by Gabriel Theodoropoulos on 8/9/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCMutableArray : NSObject

@property (nonatomic, strong) NSMutableArray *array;


-(NSUInteger)countOfArray;

-(id)objectInArrayAtIndex:(NSUInteger)index;

-(void)insertObject:(id)object inArrayAtIndex:(NSUInteger)index;

-(void)removeObjectFromArrayAtIndex:(NSUInteger)index;

-(void)replaceObjectInArrayAtIndex:(NSUInteger)index withObject:(id)object;

@end
