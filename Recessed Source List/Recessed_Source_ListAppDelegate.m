//
//  Recessed_Source_ListAppDelegate.m
//  Recessed Source List
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
