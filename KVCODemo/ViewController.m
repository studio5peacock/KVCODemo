//
//  ViewController.m
//  KVCODemo
//
//  Created by Gabriel Theodoropoulos on 8/9/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "ViewController.h"
#import "Children.h"


static void *child1Context = &child1Context;
static void *child2Context = &child2Context;

@interface ViewController ()

@property (nonatomic, strong) Children *child1;

@property (nonatomic, strong) Children *child2;

@property (nonatomic, strong) Children *child3;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Working with the child1 object.
    self.child1 = [[Children alloc] init];
    
    // Assigning values to properties directly.
    /*
     self.child1.name = @"George";
     self.child1.age = 15;
     
     NSLog(@"%@, %d", self.child1.name, self.child1.age);
     */
    
    
    // Using KVC and getting the output.
    [self.child1 setValue:@"George" forKey:@"name"];
    [self.child1 setValue:[NSNumber numberWithInteger:15] forKey:@"age"];
    
    NSString *childName = [self.child1 valueForKey:@"name"];
    NSUInteger childAge = [[self.child1 valueForKey:@"age"] integerValue];
    
    NSLog(@"%@, %d", childName, childAge);
    
    
    //////////////////////////
    
    
    // Working with the child1 object and keypaths.
    self.child2 = [[Children alloc] init];
    
    [self.child2 setValue:@"Mary" forKey:@"name"];
    [self.child2 setValue:[NSNumber numberWithInteger:35] forKey:@"age"];
    self.child2.child = [[Children alloc] init];
    
    // Setting values to the child property of the child2 object.
    [self.child2 setValue:@"Andrew" forKeyPath:@"child.name"];
    [self.child2 setValue:[NSNumber numberWithInteger:5] forKeyPath:@"child.age"];
    
    NSLog(@"%@, %d", self.child2.child.name, self.child2.child.age);
    
    
    //////////////////////////
    
    
    // Working with the child3 object.
    self.child3 = [[Children alloc] init];
    self.child3.child = [[Children alloc] init];
    self.child3.child.child = [[Children alloc] init];
    
    [self.child3 setValue:@"Tom" forKeyPath:@"child.child.name"];
    [self.child3 setValue:[NSNumber numberWithInteger:2] forKeyPath:@"child.child.age"];
    
    NSLog(@"%@, %d", self.child3.child.child.name, self.child3.child.child.age);
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Observing for changes in the name and age properties of the child1 object.
    [self.child1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    [self.child1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child1Context];
    
    
    [self.child1 setValue:@"Michael" forKey:@"name"];
    
    // Use this technique to send a notification manually in combination with the automaticallyNotifiesObserversForKey: class method in the Children class.
    /* [self.child1 willChangeValueForKey:@"name"];
    self.child1.name = @"Michael";
    [self.child1 didChangeValueForKey:@"name"]; */
    
    // Use this in combination with the overriden setter method in the Children class.
    /* self.child1.name = @"Michael"; */
    
    [self.child1 setValue:[NSNumber numberWithInteger:20] forKey:@"age"];
    
    
    // Observing for changes in the child2 object.
    [self.child2 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:child2Context];
    
    [self.child2 setValue:[NSNumber numberWithInteger:45] forKey:@"age"];
    
    
    // Observing for changes in the siblings array of the child1 object.
    [self.child1 addObserver:self forKeyPath:@"siblings" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    [self.child1 insertObject:@"Alex" inSiblingsAtIndex:0];
    [self.child1 insertObject:@"Bob" inSiblingsAtIndex:1];
    [self.child1 insertObject:@"Mary" inSiblingsAtIndex:2];
    [self.child1 removeObjectFromSiblingsAtIndex:1];
    
    
    // Observing for changes in the cousins property of the child1 object.
    [self.child1 addObserver:self forKeyPath:@"cousins.array" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    [self.child1.cousins insertObject:@"Antony" inArrayAtIndex:0];
    [self.child1.cousins insertObject:@"Julia" inArrayAtIndex:1];
    [self.child1.cousins replaceObjectInArrayAtIndex:0 withObject:@"Ben"];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.child1 removeObserver:self forKeyPath:@"name"];
    [self.child1 removeObserver:self forKeyPath:@"age"];
    [self.child2 removeObserver:self forKeyPath:@"age"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    /*
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"The name of the child was changed.");
        NSLog(@"%@", change);
    }
    
    if ([keyPath isEqualToString:@"age"]) {
        NSLog(@"The age of the child was changed.");
        NSLog(@"%@", change);
    }
    */
    
    
    if (context == child1Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the FIRST child was changed.");
            NSLog(@"%@", change);
        }
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the FIRST child was changed.");
            NSLog(@"%@", change);
        }
    }
    else if (context == child2Context){
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the SECOND child was changed.");
            NSLog(@"%@", change);
        }
    }
    else{
        if ([keyPath isEqualToString:@"siblings"]) {
            NSLog(@"%@", change);
        }
        
        if ([keyPath isEqualToString:@"cousins.array"]) {
            NSLog(@"%@", change);
        }
    }
}


@end
