#ifndef SERVEROBSERVER_H
#define SERVEROBSERVER_H

#import <Foundation/Foundation.h>

@interface ServerObserver: NSObject {
}

- (id) init;
- (void) serverAdded: (NSNotification *) notification;
- (void) serverChanged: (NSNotification *) notification;
- (void) serverRemoved: (NSNotification *) notification;
@end

#endif // SERVEROBSERVER_H
