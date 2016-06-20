//
//  Children.h
//  KVCODemo
//
//  Created by Gabriel Theodoropoulos on 8/9/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVCMutableArray.h"

@interface Children : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic) NSUInteger age;

@property (nonatomic, strong) Children *child;

@property (nonatomic, strong) NSMutableArray *siblings;

@property (nonatomic, strong) KVCMutableArray *cousins;


-(NSUInteger)countOfSiblings;

-(id)objectInSiblingsAtIndex:(NSUInteger)index;

-(void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index;

-(void)removeObjectFromSiblingsAtIndex:(NSUInteger)index;

@end
