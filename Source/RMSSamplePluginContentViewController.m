//***************************************************************************

// Copyright (C) 2009 ~ 2010 Realmac Software Ltd
//
// These coded instructions, statements, and computer programs contain
// unpublished proprietary information of Realmac Software Ltd
// and are protected by copyright law. They may not be disclosed
// to third parties or copied or duplicated in any form, in whole or
// in part, without the prior written consent of Realmac Software Ltd.

//***************************************************************************

#import "RMSSamplePlugin.h"
#import "RMSSamplePluginContentViewController.h"

//***************************************************************************

@implementation RMSSamplePluginContentViewController

@dynamic content;

- (NSString *)content
{
	return [htmlView string];
}

- (void)textDidChange:(NSNotification *)aNotification
{
	RMSSamplePlugin *p = self.representedObject;
	
	[p broadcastPluginChanged];
}

- (void)awakeFromNib
{
	RMSSamplePlugin *p = self.representedObject;
	NSString *string = p.content;
	
	if (string)
	{
		[htmlView setString:string lazily:YES];
		[htmlView colorize];
	}
}

- (id)initWithRepresentedObject:(id)inObject
{
	self = [super initWithNibName:@"RMSSamplePluginContentView" bundle:[RMSSamplePlugin bundle]];
	
	if (self)
	{
		[self setRepresentedObject:inObject];
	}
	
	return self;
}

@end

//***************************************************************************
