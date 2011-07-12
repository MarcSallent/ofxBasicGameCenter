/*
 ofxBasicGameCenter.h
 
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

#pragma once

#include "ofMain.h"
#include <GameKit/GameKit.h>

class ofxBasicGameCenter {
public:
	ofxBasicGameCenter();
	~ ofxBasicGameCenter();
	
	bool isAvailable();
	void authenticateLocalPlayer();

	void reportScore(string _category, int score;
	void reportAchievement(string _ach, float percent);

	bool isAuthenticated;
};
