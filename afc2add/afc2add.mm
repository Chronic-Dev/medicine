#include <Foundation/Foundation.h>

int main(int argc, char **argv, char **envp) {
	NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];

	NSString *plPath = @"/System/Library/Lockdown/Services.plist";
	NSMutableDictionary *plist = [[NSMutableDictionary alloc] initWithContentsOfFile:plPath];
	if(!plist) {
		fprintf(stderr, "I like my women like I like my coffee. Covered in beeeeeeeeeeeees!\n");
		return 1;
	}

	NSDictionary *afc2 = [NSDictionary dictionaryWithObjectsAndKeys:
		[NSNumber numberWithBool:1], @"AllowUnactivatedService",
		@"com.apple.afc2", @"Label",
		[NSArray arrayWithObjects:
			@"/usr/libexec/afcd",
			@"--lockdown",
			@"-d",
			@"/",
			NULL
		], @"ProgramArguments",
		NULL
		];
	[plist setObject:afc2 forKey:@"com.apple.afc2"];
	[plist writeToFile:plPath atomically:YES];
	[p drain];

	return 0;

}

// vim:ft=objc
