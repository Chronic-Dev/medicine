#import "MemLoaderOperation.h"


@implementation MemLoaderOperation
@synthesize url = _url, callback = _callback;

- (void)main {
	if(!self.url || !self.callback) return;
	
	NSURLRequest *req = [NSURLRequest requestWithURL:self.url];
	NSData *d = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
	
	[self.callback setObject:d];
	[self.callback fireOnMainThread:YES];
}

@end
