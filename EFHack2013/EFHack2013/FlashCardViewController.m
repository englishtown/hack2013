//
//  FlashCardViewController.m
//  EFHack2013
//
//  Created by Vincent on 13-4-18.
//  Copyright (c) 2013年 zhangkai. All rights reserved.
//

#import "FlashCardViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface FlashCardViewController ()

@end

@implementation FlashCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self layoutVocabularyView];
}


#define labelHeight 50

- (void)layoutVocabularyView {
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.word = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 200, labelHeight)];
    self.word.text = self.vocabulary.word;
    
    
    self.symbol = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, labelHeight)];
    self.symbol.text = [NSString stringWithFormat:@"/%@/", self.vocabulary.pronunciationUK];
    
    
    self.translation = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 220, labelHeight)];
    self.translation.text = [NSString stringWithFormat:@"[%@]  %@", self.vocabulary.partOfSpeech, self.vocabulary.translation];
    
    
    UIButton *audioButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 50, 50, 50)];
    [audioButton setBackgroundImage:[UIImage imageNamed:@"sound_big.png"] forState:UIControlStateNormal];
    [audioButton addTarget:self action:@selector(playAudio) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.word];
    [self.view addSubview:self.symbol];
    [self.view addSubview:self.translation];
    [self.view addSubview:audioButton];
    
}

- (void)playAudio {
    
    dispatch_queue_t playAudioQ = dispatch_queue_create("playAudio", NULL);
    dispatch_async(playAudioQ, ^{
        
        NSString *_mp3file = self.vocabulary.audioPath;
        NSData *_mp3data = [NSData dataWithContentsOfURL:[NSURL URLWithString: _mp3file]];
        
        NSError *error;
        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithData:_mp3data error:&error];
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        [[AVAudioSession sharedInstance] setActive: YES error: nil];
        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
        [audioPlayer play];
    }
                   );
    dispatch_release(playAudioQ);
}


@end
