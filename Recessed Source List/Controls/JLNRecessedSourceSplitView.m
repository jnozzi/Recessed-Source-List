//
//  JLNRecessedSourceSplitView.m
//  JLNRecessedTableView
//
//  Created by Joshua Nozzi on 7/22/11.
//  Copyright 2011 Joshua Nozzi. All rights reserved.
//


#import "JLNRecessedSourceSplitView.h"


@implementation JLNRecessedSourceSplitView


- (NSColor *)dividerColor
{
	return [NSColor colorWithCalibratedWhite:0.83 alpha:1.0];
}

- (void)drawDividerInRect:(NSRect)rect
{
	
	[super drawDividerInRect:rect];
	
	// Create the fade gradient (fadient?)
	NSGradient * fadient = [[[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedWhite:0.97 alpha:1.0] 
														  endingColor:[NSColor colorWithCalibratedWhite:0.97 alpha:0.0]] autorelease];
	
	// Draw the top fade (4x10)
	NSRect topFade = NSMakeRect(NSMaxX(rect) - 4, NSMaxY(rect) - 10, 4, 10);
	[fadient drawInRect:topFade angle:-90];
	
	// Draw the bottom fade (4x10)
	NSRect bottomFade = NSMakeRect(NSMaxX(rect) - 4, 0, 4, 10);
	[fadient drawInRect:bottomFade angle:90];

}


@end
