//
//  JLNRecessedBackingPane.m
//  JLNRecessedTableView
//
//  Created by Joshua Nozzi on 7/22/11.
//  Copyright 2011 Joshua Nozzi. All rights reserved.
//
//	 This software is supplied to you by Joshua Nozzi in consideration 
//	 of your agreement to the following terms, and your use, installation, 
//	 modification or redistribution of this software constitutes 
//	 acceptance of these terms. If you do not agree with these terms, 
//	 please do not use, install, modify or redistribute this software.
//	 
//	 In consideration of your agreement to abide by the following terms, 
//	 and subject to these terms, Joshua Nozzi grants you a personal, 
//	 non-exclusive license, to use, reproduce, modify and redistribute 
//	 the software, with or without modifications, in source and/or binary 
//	 forms; provided that if you redistribute the software in its entirety 
//	 and without modifications, you must retain this notice and the 
//	 following text and disclaimers in all such redistributions of the 
//	 software, and that in all cases attribution of Joshua Nozzi as the 
//	 original author of the source code shall be included in all such 
//	 resulting software products or distributions. Neither the name, 
//	 trademarks, service marks or logos of Joshua Nozzi may be used to 
//	 endorse or promote products derived from the software without specific 
//	 prior written permission from Joshua Nozzi. Except as expressly stated 
//	 in this notice, no other rights or licenses, express or implied, are 
//	 granted by Joshua Nozzi herein, including but not limited to any patent 
//	 rights that may be infringed by your derivative works or by other works 
//	 in which the software may be incorporated.
//	 
//	 THIS SOFTWARE IS PROVIDED BY JOSHUA NOZZI ON AN "AS IS" BASIS. JOSHUA 
//	 NOZZI MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT 
//	 LIMITATION THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY 
//	 AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE 
//	 AND OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
//	 
//	 IN NO EVENT SHALL JOSHUA NOZZI BE LIABLE FOR ANY SPECIAL, INDIRECT, 
//	 INCIDENTAL OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
//	 PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
//	 PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF THE 
//	 USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, 
//	 HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING 
//	 NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF JOSHUA NOZZI HAS 
//	 BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
