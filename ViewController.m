//
//  ViewController.m
//  flappy test
//
//  Created by siddhant on 5/7/17.
//  Copyright © 2017 siddhant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) GameOver {
    columnTop.hidden = YES;
    columnBottom.hidden = YES;
    startGame.hidden = YES;
    Bird.hidden = YES;
    restartGame.hidden = NO;
    [BirdMove invalidate];
    [columnMove invalidate];
    D = [NSUserDefaults standardUserDefaults];
    [D setObject:scoreLabel.text forKey:@"score"];
    [D synchronize];
}



- (IBAction)startGame:(id)sender {
    
    columnTop.hidden = NO;
    columnBottom.hidden = NO;
    startGame.hidden = YES;
    Bird.hidden = NO;
    scoreNumber = 0;
    scoreLabel.text = [NSString stringWithFormat:@"%i", scoreNumber];
    BirdMove = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(birdMoving) userInfo:nil repeats:YES];
    columnMove = [NSTimer scheduledTimerWithTimeInterval:0.004 target:self selector:@selector(columnMoving) userInfo:nil repeats:YES];
//    CM = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(RepaintColumns) userInfo:nil repeats:YES];
    [self RepaintColumns];
    

    
    
}

- (IBAction)RestartGame:(id)sender {
    
    Bird.hidden = YES;
    Bird.center = CGPointMake(16, 308);
    
    restartGame.hidden = YES;
    startGame.hidden = NO;
    columnBottom.hidden = YES;
    columnTop.hidden = YES;
    D = [NSUserDefaults standardUserDefaults];
    NSString *score = [D stringForKey:@"score"];
    prevScore.text = score;
}

- (void) RepaintColumns {
    randColTopPos = arc4random() % 350;
    randColTopPos = randColTopPos - 220;
    randColBottomPos = randColTopPos + 665;
    
    columnTop.center = CGPointMake(325,randColTopPos );
    columnBottom.center = CGPointMake(325, randColBottomPos);
}

- (void) birdMoving {
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - birdJump);
    birdJump = birdJump - 5;
    
    if(birdJump < -15) {
        birdJump = -15;
    }
    
}


- (void) columnMoving {
    columnTop.center = CGPointMake(columnTop.center.x-1, columnTop.center.y);
    columnBottom.center = CGPointMake(columnBottom.center.x-1, columnBottom.center.y);
    
    if(columnTop.center.x == -34 ) {
        
        [self RepaintColumns];
    }
    
    if(CGRectIntersectsRect(Bird.frame, columnTop.frame)) {
        NSURL *soundUrl= [NSURL fileURLWithPath:@"/Users/SiD/Desktop/objective-C/flappy/flappy/s2.mp3"];
        
        _audioPlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        _audioPlayer.volume=1.0;  //Give Volume
        
        _audioPlayer.numberOfLoops= 0;  //Give number of loop for repeating sound
        
        _audioPlayer.enableRate = YES;
        
        _audioPlayer.rate=1.0f;  //Give for fast playing sound. default value is 1.0f;
        
        [_audioPlayer play];
        scoreNumber++;
        scoreLabel.text = [NSString stringWithFormat:@"%i", scoreNumber];
        [self GameOver];
    }
    if(CGRectIntersectsRect(Bird.frame, columnBottom.frame)) {
        NSURL *soundUrl= [NSURL fileURLWithPath:@"/Users/SiD/Desktop/objective-C/flappy/flappy/s2.mp3"];
        
        _audioPlayer1=[[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        _audioPlayer1.volume=1.0;  //Give Volume
        
        _audioPlayer1.numberOfLoops= 0;  //Give number of loop for repeating sound
        
        _audioPlayer1.enableRate = YES;
        
        _audioPlayer1.rate=1.0f;  //Give for fast playing sound. default value is 1.0f;
        
        [_audioPlayer1 play];
        scoreNumber++;
        scoreLabel.text = [NSString stringWithFormat:@"%i", scoreNumber];
        [self GameOver];
    }
    
    if(columnBottom.center.x == -12) {
    //Declare Globally

//        NSString *path =[NSString stringWithFormat:@"%@/Users/SiD/Desktop/objective-C/flappy/flappy/s1.mp3",[[NSBundle mainBundle] resourcePath]];         //Give Your Local Path
        
        NSURL *soundUrl= [NSURL fileURLWithPath:@"/Users/SiD/Desktop/objective-C/flappy/flappy/s1.mp3"];
        
        _audioPlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        _audioPlayer.volume=1.0;  //Give Volume
        
        _audioPlayer.numberOfLoops= 0;  //Give number of loop for repeating sound
        
        _audioPlayer.enableRate = YES;
        
        _audioPlayer.rate=1.0f;  //Give for fast playing sound. default value is 1.0f;
        
        [_audioPlayer play];
        scoreNumber++;
        scoreLabel.text = [NSString stringWithFormat:@"%i", scoreNumber];
    }
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event {
    birdJump = 20;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    columnTop.hidden = YES;
    columnBottom.hidden = YES;
    restartGame.hidden = YES;
    prevScore.hidden = NO;
     D = [NSUserDefaults standardUserDefaults];
    NSString *score = [D stringForKey:@"score"];
    prevScore.text = score;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
