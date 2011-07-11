/*
 ofxBasicGameCenter.mm
 
 Created on 11/11/10 by
 
 Marc Sallent - http://wechoosefun.com/
 
 This is essentially a compilation of functions, modified to play nicely with openFrameworks
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
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