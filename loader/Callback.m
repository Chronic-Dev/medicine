#include "Callback.h"

@implementation Callback
@synthesize target = _target, action = _action, object = _object;

- (id)initWithTarget:(id)t action:(SEL)a object:(id)o {
	if((self = [super init])) {
		self.target = t;
		self.action = a;
		self.object = o;
	}

	return self;
}

- (void)fire {
	[self fireOnMainThread:NO];
}

- (void)fireOnMainThread:(BOOL)b {
	if(b) {
		[self.target performSelectorOnMainThread:self.action withObject:self.object waitUntilDone:NO];
	} else {
		[self.target performSelector:self.action withObject:self.object];
	}
}

@end