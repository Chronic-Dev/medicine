#import <Foundation/Foundation.h>
#import "Callback.h"

@interface MemLoaderOperation : NSOperation {
	NSURL *_url;
	Callback *_callback;
}

@property (nonatomic, retain) NSURL *url;
@property (nonatomic, retain) Callback *callback;


@end
