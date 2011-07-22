//
//  Recessed_Source_ListAppDelegate.m
//  Recessed Source List
//
//  Created by Joshua Nozzi on 7/22/11.
//  Copyright 2011 Joshua Nozzi. All rights reserved.
//


#import "Recessed_Source_ListAppDelegate.h"


@implementation Recessed_Source_ListAppDelegate


#pragma mark App Lifecycle

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	
	// Build the sources array
	sources = [[NSMutableArray array] retain];
	
	NSDictionary * joshDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Josh's Site", @"title", 
							   [NSURL URLWithString:@"http://joshua.nozzi.name"], @"url", 
							   nil];
	[sources addObject:joshDict];
	
	NSDictionary * bookDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Xcode Book", @"title", 
							   [NSURL URLWithString:@"http://xcodebook.com"], @"url", 
							   nil];
	[sources addObject:bookDict];
	
	NSDictionary * twitterDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Twitter", @"title", 
								  [NSURL URLWithString:@"http://twitter.com/jnozzi"], @"url", 
								  nil];
	[sources addObject:twitterDict];
	
	NSDictionary * gplusDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Google+", @"title", 
								[NSURL URLWithString:@"https://plus.google.com/111089623202454701415/about?hl=en"], @"url", 
								nil];
	[sources addObject:gplusDict];
	
	NSDictionary * bartasDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Bartas", @"title", 
								 [NSURL URLWithString:@"http://bartastechnologies.com"], @"url", 
								 nil];
	[sources addObject:bartasDict];
	
	// Kick the table view
	[tableView reloadData];
	
}


#pragma mark Table Data Source / Delegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
	return [sources count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
	return [[sources objectAtIndex:rowIndex] objectForKey:@"title"];
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
	NSLog(@"Selected %@", [[sources objectAtIndex:[tableView selectedRow]] objectForKey:@"title"]);
	[[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[[sources objectAtIndex:[tableView selectedRow]] objectForKey:@"url"]]];
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
	return 26.0;
}


@end
