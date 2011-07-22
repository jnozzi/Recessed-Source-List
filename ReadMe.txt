Recessed Source List
Written by Joshua Nozzi
http://joshua.nozzi.name
========================


What is Recessed Source List?
----------------------------

Recessed Source List is a set of view subclasses (NSTableView, NSSplitView, and NSView, specifically) that work together to achieve the "recessed list" look seen in Dictionary.app when a list of search results is displayed on the left.


What platforms does it support?
-------------------------------

It might work on 10.4 (I think), but it should definitely work on 10.5 and beyond.


What are the licensing requirements?
------------------------------------

See the license document (License.txt) that is included with the source code. It is free to use but requires attribution. Feel free to contact me at joshua@nozzi.name with any licensing questions.


How do I use it in my project?
------------------------------

1 - Copy all the source from the Controls subfolder of the demo project into your own project.
2 - Create a source-list-on-the-left split view setup as seen in the demo app's MainMenu.xib (copy and paste is easiest).
3 - There is no step 3.

The views work like this: 

 - The custom split view (which must be in thin line divider mode) draws a standard line with a fade at the top and bottom.
 - The left pane is a custom NSView that draws the shadow with a similar fade at top and bottom.
 - The table view leaves room at the top and bottom (I use 11 pixels) to allow the left pane's fade to show up and draws the same shadow.
 - The backing view is necessary because the table's top edge moves when scrolled (kind of obvious) so the "fade" would move as well if the table were to draw it.


How can I reach you?
--------------------

You can e-mail me at joshua@nozzi.name. I'm happy to answer most questions about this source code but am not willing to "hold your hand" or debug your code. It's straightforward to use if you are familiar with Cocoa and take a few moments to study the source. Please do your homework first. Questions sent to me that make it obvious the sender didn't do their homework will be ignored (or will possibly receive an annoyed and decidedly unhelpful response - author's choice).


