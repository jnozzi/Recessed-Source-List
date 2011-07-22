//
//  JLNRecessedTableView.m
//  JLNRecessedTableView
//
//  Created by Joshua Nozzi on 7/22/11.
//  Copyright 2011 Joshua Nozzi. All rights reserved.
//


#import "JLNRecessedTableView.h"


@implementation JLNRecessedTableView


- (void)drawBackgroundInClipRect:(NSRect)clipRect
{
	
	// Super first
	[super drawBackgroundInClipRect:clipRect];
	
	// Figure out right edge of row, leaving enough room for a 4px gradient
	NSRect rightEdge = clipRect;
	rightEdge.size.width = 4.0;
	rightEdge.origin.x = NSMaxX([self bounds]) - 4.0;
	
	// Does the clip rect intersect enough of the right edge?
	if (NSIntersectsRect(clipRect, rightEdge))
	{
		
		// Create the gradient (89, 91, 93, 95)
		NSGradient * gradient = [[[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedWhite:0.89 alpha:1.0] 
															   endingColor:[NSColor colorWithCalibratedWhite:0.95 alpha:1.0]] autorelease];
		
		// Set clip and draw the gradient
		[NSGraphicsContext saveGraphicsState];
		[[NSBezierPath bezierPathWithRect:clipRect] setClip];
		[gradient drawInRect:rightEdge angle:180];
		[NSGraphicsContext restoreGraphicsState];
		
	}
	
}


@end
