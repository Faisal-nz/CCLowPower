#import "../CC.h"

static BOOL overrideInternal;

extern "C" BOOL MGGetBoolAnswer(CFStringRef);

%hookf(BOOL, MGGetBoolAnswer, CFStringRef key)
{
	#define k(key_) CFEqual(key, CFSTR(key_))
	if (overrideInternal && k("apple-internal-install"))
			return YES;
	return %orig;
}

// @Andywiik AndrewWiik 
%hook CCUIButtonStackPagingView


- (void)_organizeButtonsInPages 
{
	overrideInternal = YES;
	%orig;
	overrideInternal = NO;
}

-(void)setPagingAxis:(NSInteger)arg1 
{
	%orig(0);
}

-(NSInteger)pagingAxis 
{
	return 0;
}

%end

%hook CCUILowPowerModeSetting

+ (bool)isSupported:(int)arg1
{
	return YES;
}


+ (NSString *)statusOffString
{
	return @"Low Power Mode: Off";
}


+ (NSString *)statusOnString
{
	return @"Low Power Mode: On";
}


- (UIImage *)glyphImageForState:(UIControlState)state
{
	return [UIImage imageNamed:@"Shortcut-Battery" inBundle:[NSBundle bundleWithPath:@"/Applications/Preferences.app/"]];
}


%end