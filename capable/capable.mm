#include <Foundation/Foundation.h>

int main(int argc, char **argv, char **envp) {
	if(argc < 3) {
		fprintf(stderr, "I am not Jiminy Cricket.\n");
		return 1;
	}

	NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];

	NSString *platform = [[NSString stringWithUTF8String:argv[1]] retain];
	NSString *remove = [[NSString stringWithUTF8String:argv[2]] retain];

	NSString *plPath = [[NSString alloc] initWithFormat:@"/System/Library/CoreServices/SpringBoard.app/%@.plist", platform];
	NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:plPath];
	if(!plist) {
		fprintf(stderr, "I like my women like I like my coffee. Covered in beeeeeeeeeeeees!\n");
		return 1;
	}

	NSMutableDictionary *capabilities = [plist objectForKey:@"capabilities"];
	[capabilities removeObjectForKey:remove];
	[plist setObject:capabilities forKey:@"capabilities"];
	[plist writeToFile:plPath atomically:YES];
	[p drain];

	return 0;
}

// vim:ft=objc
