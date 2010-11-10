#import <UIKit/UIKit.h>
#include <unistd.h>

int main(int argc, char *argv[]) {	

	setuid(0);
	setgid(0);
	
	UIApplicationMain(argc, argv, @"UIApplication", @"LoaderAppDelegate");
	
	return 0;
}
