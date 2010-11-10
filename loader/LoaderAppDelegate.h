#import <UIKit/UIKit.h>
#import "LoaderVC.h"

@interface LoaderAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	LoaderVC *_loader;
	BOOL _reboot;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, assign) BOOL reboot;

@end

