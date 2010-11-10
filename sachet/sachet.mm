#include <Foundation/Foundation.h>
#include <unistd.h>
#include <stdio.h>

int main(int argc, char **argv, char **envp) {
	if(argc < 2) {
		fprintf(stderr, "I am not Jiminy Cricket.\n");
		return 1;
	}

	NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];

	NSString *appPath = [[NSString stringWithUTF8String:argv[1]] retain];
	NSBundle *appBundle = [NSBundle bundleWithPath:appPath];
	if(!appBundle) {
		fprintf(stderr, "Go get your cows elsewhere.\n");
		return 1;
	}

	NSString *miPath = @"/private/var2/mobile/Library/Caches/com.apple.mobile.installation.plist";
	NSMutableDictionary *miDict = [[NSMutableDictionary alloc] initWithContentsOfFile:miPath];
	NSMutableDictionary *system = [[miDict objectForKey:@"System"] mutableCopy];
	if(!system) {
		fprintf(stderr, "I like my women like I like my coffee. Covered in beeeeeeeeeeeees!\n");
		return 1;
	}

	NSMutableDictionary *added = [[appBundle infoDictionary] mutableCopy];
	[added setObject:@"System" forKey:@"ApplicationType"];
	[added setObject:appPath forKey:@"Path"];

	NSString *cfbi = [added objectForKey:@"CFBundleIdentifier"];
	if(!cfbi) {
		fprintf(stderr, "My pants are on fire and there's nothing you can do to stop me!\n");
		return 1;
	}

	[system setObject:added forKey:cfbi];
	[miDict setObject:system forKey:@"System"];

	[miDict writeToFile:miPath atomically:YES];
	chown([miPath UTF8String], 501, 501);

	[p drain];
}

// vim:ft=objc
