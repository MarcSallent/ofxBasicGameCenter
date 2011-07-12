/*
 ofxBasicGameCenter.mm
 
 Created on 11/11/10 by
 Marc Sallent - http://wechoosefun.com/
 This is essentially a compilation of functions, modified to play nicely with openFrameworks
 
 Copyright (C) 2010 by Marc Sallent
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
*/

#import <Foundation/Foundation.h>

#include "ofxBasicGameCenter.h"

ofxBasicGameCenter::ofxBasicGameCenter(){
	isAuthenticated=false;
	if (isAvailable()) {
		authenticateLocalPlayer();
	}
}

ofxBasicGameCenter::~ ofxBasicGameCenter(){
}


bool ofxBasicGameCenter::isAvailable(){
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
    // The device must be running running iOS 4.1 or later.
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
    return (gcClass && osVersionSupported);
}



void ofxBasicGameCenter::authenticateLocalPlayer(){
    [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError *error) {
		if (error == nil)
        {
			// Insert code here to handle a successful authentication.
			isAuthenticated=true;
		}
		else
		{
			// Your application can process the error parameter to report the error to the player.
			isAuthenticated=false;
		}
	}];
}

void ofxBasicGameCenter::reportScore(string _category, int score){
	if (isAvailable()) {
		int64_t score = static_cast<int64_t>(score);
		NSString * category = [NSString stringWithUTF8String: _category.c_str()];
		GKScore *scoreReporter = [[[GKScore alloc] initWithCategory:category] autorelease];
		scoreReporter.value = score;
		[scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
			if (error != nil){
				// handle the reporting error
			}
		}];
	}
}
void ofxBasicGameCenter::reportAchievement(string _ach, float percent){
	if (isAvailable()) {
		NSString * identifier = [NSString stringWithUTF8String: _ach.c_str()];
			GKAchievement *achievement = [[[GKAchievement alloc] initWithIdentifier: identifier] autorelease];
			if (achievement)
			{
				achievement.percentComplete = percent;
				[achievement reportAchievementWithCompletionHandler:^(NSError *error)
				 {
					 if (error != nil){
                     }
                }];
			}
	}
}