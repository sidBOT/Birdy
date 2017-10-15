//
//  ViewController.h
//  flappy
//
//  Created by siddhant on 5/8/17.
//  Copyright © 2017 siddhant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

int birdJump = 30;
int randColTopPos;
int randColBottomPos;
int scoreNumber = 0;
int prevScoreNumber = 0;

@interface ViewController : UIViewController {
    
    IBOutlet UIImageView *columnTop;
    IBOutlet UIImageView *columnBottom;
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *startGame;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *prevScore;
    IBOutlet UIButton *restartGame;
    AVAudioPlayer *_audioPlayer;
    AVAudioPlayer *_audioPlayer1;
    
    NSTimer *BirdMove;
    NSTimer *columnMove;
    NSTimer *CM;
    NSUserDefaults *D;

    
}

- (IBAction)startGame:(id)sender;
- (void) birdMoving;
- (void) columnMoving;
- (void) RepaintColumns;
- (void) GameOver;
- (IBAction)RestartGame:(id)sender;
@end


