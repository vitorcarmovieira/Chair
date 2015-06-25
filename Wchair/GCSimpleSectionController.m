//
//  GCSimpleSectionController.m
//  Demo
//
//  Created by Guillaume Campagna on 11-04-21.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import "GCSimpleSectionController.h"

@interface GCSimpleSectionController ()

@property (nonatomic, readonly) NSArray* colors;
@property (nonatomic) NSString* title;

@end

@implementation GCSimpleSectionController

@synthesize colors;

#pragma mark -
#pragma mark Subclass

- (NSString *)title {
    return NSLocalizedString(@"TIpo1",);
}

- (void) setTitle:(NSString *)title{
    
    self.title = title;
}

- (NSString *)titleContentForRow:(NSUInteger)row {
    return [self.colors objectAtIndex:row];
}

- (NSUInteger)contentNumberOfRow {
    return [self.colors count];
}

- (void)didSelectContentCellAtRow:(NSUInteger)row {
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark -
#pragma mark Getters

- (NSArray *)colors {
    if (colors == nil) {
        colors = [[NSArray alloc] initWithObjects:@"Exercicio1", @"Exercicio2", @"Exercicio3", @"Exercicio4", nil];
    }
    return colors;
}

@end
