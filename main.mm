#include <QCoreApplication>
#include <QTimer>
#import <Syphon.h>

#include "serverobserver.h"

void runLoop()
{
    [[NSRunLoop currentRunLoop]
     runMode: NSDefaultRunLoopMode
     runBeforeDate: [NSDate dateWithTimeIntervalSinceNow: 1]];

    // or

//     [[NSRunLoop currentRunLoop]
//      runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 1]];
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    QTimer timer;
    timer.setInterval(1);
    QObject::connect(&timer, &QTimer::timeout, runLoop);
    timer.start();

    id serverObserver = [[ServerObserver alloc] init];

    [[NSNotificationCenter defaultCenter]
     addObserver: serverObserver
     selector: @selector(serverAdded:)
     name: SyphonServerAnnounceNotification
     object: nil];

    [[NSNotificationCenter defaultCenter]
     addObserver: serverObserver
     selector: @selector(serverChanged:)
     name: SyphonServerUpdateNotification
     object: nil];

    [[NSNotificationCenter defaultCenter]
     addObserver: serverObserver
     selector: @selector(serverRemoved:)
     name: SyphonServerRetireNotification
     object: nil];

    // List servers
    SyphonServerDirectory *sharedDirectory = [SyphonServerDirectory sharedDirectory];
    NSArray *servers = [sharedDirectory servers];
    NSLog(@"NSERVERS %d", servers.count);

    for (NSDictionary *server in servers) {
        NSLog(@"SERVER IS: %@", server);
    }

    return a.exec();
}
