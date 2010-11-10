#import <UIKit/UIKit.h>

@class UIProgressHUD;
@interface LoaderVC : UITableViewController <UIActionSheetDelegate> {
	UIProgressHUD *_myHud;
	NSOperationQueue *_queue;
	NSDictionary *_sourceDict;
	NSIndexPath *_currentIndex;
	
	NSURLResponse *downloadResponse;
	int bytesReceived;
}

- (void)setDownloadResponse:(NSURLResponse *)aDownloadResponse;
- (void)suicide;
@end
