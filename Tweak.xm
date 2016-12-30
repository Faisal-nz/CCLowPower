#import "../CC.h"

%hook CCUILowPowerModeSetting

+ (bool)isInternalButton
{
	return NO;
}

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
	return [UIImage imageNamed:@"pinDot@2x.png" inBundle:[NSBundle bundleWithPath:@"/Applications/CoreAuthUI.app/"]];
}


%end