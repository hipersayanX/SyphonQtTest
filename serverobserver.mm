#include "serverobserver.h"

@implementation ServerObserver

- (id) init
{
    self = [super init];

    if (!self)
        return nil;

    return self;
}

- (void) serverAdded: (NSNotification *) notification
{
    NSLog(@"ADDED");
}

- (void) serverChanged: (NSNotification *) notification
{
    NSLog(@"CHANGED");
}

- (void) serverRemoved: (NSNotification *) notification
{
    NSLog(@"REMOVED");
}

@end
