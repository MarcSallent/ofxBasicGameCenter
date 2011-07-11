#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
	ofRegisterTouchEvents(this);
	ofxAccelerometer.setup();
	ofxiPhoneAlerts.addListener(this);
	
	
    
    // checks if Game Center is available and authomatically authenticates the current user
    gameCenter = new ofxBasicGameCenter();

    // Is Game Center available in this device? (it needs iOS 4.1 and some parental controls disabled) check:
    // gameCenter->isAvailable();
	
    // Is the current player authenticated? check:
    // gameCenter->isAuthenticated;    

}

//--------------------------------------------------------------
void testApp::update(){
}

//--------------------------------------------------------------
void testApp::draw(){
    
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){
    // Sample Reporting Score
    string category="YOUR_SCORE_TABLE_STRING_ID"; // score, collected_stars, playing_time, ... configure it in itunesconnect
    int score = 1234567890;
	gameCenter->reportScore( category, score );
    
    
    // Sample Reporting Achievement
    string achievement = "YOUR_ACHIEVEMENT_STRING_ID"; // world_1_complete, killed_yoda, ... configure it in itunesconnect
    float percentComplete = 100; // from 0 to 100. When it's 100, it appears as complete in... somewhere in GameCenter
    gameCenter->reportAchievement(achievement, percentComplete);

    
    
    
    
    
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs &touch){
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs &touch){
}