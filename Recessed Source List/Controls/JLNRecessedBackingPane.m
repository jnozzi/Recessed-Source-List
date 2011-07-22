//
//  JLNRecessedBackingPane.m
//  JLNRecessedTableView
//
//  Created by Joshua Nozzi on 7/22/11.
//  Copyright 2011 Joshua Nozzi. All rights reserved.
//


#import "JLNRecessedBackingPane.h"


@implementation JLNRecessedBackingPane


- (void)drawRect:(NSRect)dirtyRect
{
	
	NSRect b = [self bounds];
	
	// Fill the bounds with our background color
	[[NSColor colorWithCalibratedWhite:0.97 alpha:1.0] set];
	NSRectFill(b);
	
	// Figure out right edge of view, leaving enough room for a 4px gradient
	NSRect rightEdge = b;
	rightEdge.size.width = 4.0;
	rightEdge.origin.x = NSMaxX(b) - 4.0;
	
	// Create the edge gradient (89, 91, 93, 95)
	NSGradient * edgeGradient = [[[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedWhite:0.89 alpha:1.0] 
														   endingColor:[NSColor colorWithCalibratedWhite:0.95 alpha:1.0]] autorelease];
	
	// Draw the edge gradient
	[edgeGradient drawInRect:rightEdge angle:180];
	
	// Create the fade gradient (fadient?)
	NSGradient * fadient = [[[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedWhite:0.97 alpha:1.0] 
														  endingColor:[NSColor colorWithCalibratedWhite:0.97 alpha:0.0]] autorelease];
	
	// Draw the top fade (4x10)
	NSRect topFade = NSMakeRect(NSMaxX(b) - 4, NSMaxY(b) - 10, 4, 10);
	[fadient drawInRect:topFade angle:-90];
	
	// Draw the bottom fade (4x10)
	NSRect bottomFade = NSMakeRect(NSMaxX(b) - 4, 0, 4, 10);
	[fadient drawInRect:bottomFade angle:90];
	
}


@end
