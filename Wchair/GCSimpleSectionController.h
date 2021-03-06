//
//  GCSimpleSectionController.h
//  Demo
//
//  Created by Guillaume Campagna on 11-04-21.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCRetractableSectionController.h"

//This is a simple example showing how to use really easily GCRetractableSectionController

@interface GCSimpleSectionController : GCRetractableSectionController

@property (nonatomic) NSString* titulo;
- (id)initWithArray:(NSArray*) array viewController:(UIViewController *)givenViewController;

@end
