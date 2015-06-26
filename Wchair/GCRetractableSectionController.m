//
//  GCRetractableSectionController.m
//  Mtl mobile
//
//  Created by Guillaume Campagna on 09-10-19.
//  Copyright 2009 LittleKiwi. All rights reserved.
//

#import "GCRetractableSectionController.h"
#import "Wchair-Swift.h"

@interface GCRetractableSectionController ()

@property (nonatomic, assign) UIViewController *viewController;

- (void) setAccessoryViewOnCell:(UITableViewCell*) cell;

@end

@implementation GCRetractableSectionController

@synthesize useOnlyWhiteImages, titleTextColor, titleAlternativeTextColor;
@synthesize viewController;
@synthesize open, rowAnimation;

#pragma mark -
#pragma mark Initialisation

- (id) initWithViewController:(UIViewController*) givenViewController {
	if ((self = [super init])) {
        if (![givenViewController respondsToSelector:@selector(tableView)]) {
            //The view controller MUST have a tableView proprety
            [NSException raise:@"Wrong view controller" 
                        format:@"The passed view controller to GCRetractableSectionController must respond to the tableView proprety"];
        }
        
		self.viewController = givenViewController;
		self.open = NO;
        self.useOnlyWhiteImages = NO;
        self.rowAnimation = UITableViewRowAnimationTop;
	}
	return self;
}

#pragma mark -
#pragma mark Getters

- (UITableView*) tableView {
	return [self.viewController performSelector:@selector(tableView)];
}

- (NSUInteger) numberOfRow {
    return (self.open) ? self.contentNumberOfRow + 1 : 1;
}

- (NSUInteger) contentNumberOfRow {
	return 0;
}

- (NSString*) title {
	return NSLocalizedString(@"No title",);
}

- (NSString*) titleContentForRow:(NSUInteger) row {
	return NSLocalizedString(@"No title",);
}

#pragma mark -
#pragma mark Cells

- (UITableViewCell *) cellForRow:(NSUInteger)row {
	UITableViewCell* cell = nil;
	
	if (row == 0) cell = [self titleCell];
	else cell = [self contentCellForRow:row - 1];
	
	return cell;
}

- (UITableViewCell *) titleCell {
	
	TitleTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"titleCell"];
	if (cell == nil) {
		cell = [[TitleTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"titleCell"];
	}
    
    cell.titulo.text = self.title;
    
	if (self.contentNumberOfRow != 0) {
        
		cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        [self setAccessoryViewOnCell:cell];
	}
	else {
		cell.detailTextLabel.text = NSLocalizedString(@"No item",);
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryView = nil;
        cell.textLabel.textColor = [UIColor blackColor];
	}
    
    if ([self.title  isEqual: @"Ombro"]){
        
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Cadeirantes-20"]];
    } else if ([self.title isEqual:@"Costa"]){
        
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Cadeirantes-21"]];
    } else if ([self.title isEqual:@"Biceps"]){
        
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Cadeirantes-22"]];
    } else{
        
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Cadeirantes-23"]];
    }
    
    
	
	return cell;
}

- (UITableViewCell *) contentCellForRow:(NSUInteger)row {
	
	TipoTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"tipoExercicioCell"];
	if (cell == nil) {
		cell = [[TipoTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tipoExercicioCell"];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
    cell.nome.text = [self titleContentForRow:row];
    cell.imagem.image = [UIImage imageNamed:@"Rugby"];
	
	return cell;
}

- (void) setAccessoryViewOnCell:(UITableViewCell*) cell {
	NSString* path = nil;
	if (self.open) {
		path = @"UpAccessory";
        if (self.titleAlternativeTextColor == nil) cell.textLabel.textColor =  [UIColor colorWithRed:0.191 green:0.264 blue:0.446 alpha:1.000];
        else cell.textLabel.textColor = self.titleAlternativeTextColor;
	}	
	else {
		path = @"DownAccessory";
		cell.textLabel.textColor = (self.titleTextColor == nil ? [UIColor blackColor] : self.titleTextColor);
	}
	
	UIImage* accessoryImage = [UIImage imageNamed:path];
	UIImage* whiteAccessoryImage = [UIImage imageNamed:[[path stringByDeletingPathExtension] stringByAppendingString:@"White"]];
	
	UIImageView* imageView;
	if (cell.accessoryView != nil) {
		imageView = (UIImageView*) cell.accessoryView;
		imageView.image = (self.useOnlyWhiteImages ? whiteAccessoryImage : accessoryImage);
		imageView.highlightedImage = whiteAccessoryImage;
    }
	else {
		imageView = [[UIImageView alloc] initWithImage:(self.useOnlyWhiteImages ? whiteAccessoryImage : accessoryImage)];
		imageView.highlightedImage = whiteAccessoryImage;
		cell.accessoryView = imageView;
//		[imageView release];
	}
}

#pragma mark -
#pragma mark Select Cell

- (void) didSelectCellAtRow:(NSUInteger)row {
	if (row == 0) [self didSelectTitleCell];
	else [self didSelectContentCellAtRow:row - 1];
}

- (void) didSelectTitleCell {
	self.open = !self.open;
	if (self.contentNumberOfRow != 0) [self setAccessoryViewOnCell:[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]]];
	
	NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
	NSUInteger section = indexPath.section;
	NSUInteger contentCount = self.contentNumberOfRow;
	
	[self.tableView beginUpdates];
	
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (self.open) [self.tableView insertRowsAtIndexPaths:rowToInsert withRowAnimation:self.rowAnimation];
	else [self.tableView deleteRowsAtIndexPaths:rowToInsert withRowAnimation:self.rowAnimation];
//	[rowToInsert release];
	
	[self.tableView endUpdates];
	
	if (self.open) [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) didSelectContentCellAtRow:(NSUInteger)row {}

@end