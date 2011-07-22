//
//  Recessed_Source_ListAppDelegate.h
//  Recessed Source List
//
//  Created by Joshua Nozzi on 7/22/11.
//  Copyright 2011 Joshua Nozzi. All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>


@interface Recessed_Source_ListAppDelegate : NSObject < NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate >
{
	
	IBOutlet NSWindow *										window;
	IBOutlet NSTableView *									tableView;
	IBOutlet WebView *										webView;
	
	NSMutableArray *										sources;
	
}


@end
