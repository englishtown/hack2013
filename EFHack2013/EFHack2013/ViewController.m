//
//  ViewController.m
//  EFHack2013
//
//  Created by zhangkai on 4/18/13.
//  Copyright (c) 2013 zhangkai. All rights reserved.
//

#import "ViewController.h"
#import "Vocabulary.h"
#import "VocabularyDict.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self testCreateVocabulary];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testCreateVocabulary
{
    // create test data
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"afternoon" forKey:@"Word"];
    [dict setObject:@"下午" forKey:@"Translation"];
    [dict setObject:@"http://www.englishtown.com/etownresources/dictionary_mp3/Headword/US/c/ca/cak/cake_us_1.mp3" forKey:@"AudioPath"];
    [dict setObject:@"noun" forKey:@"PartofSpeech"];
    [dict setObject:@"ˌɑːftəˈnuːn" forKey:@"PhoneticPronunciationUK"];
    [dict setObject:@"ˌɑːftəˈnuːn" forKey:@"PhoneticPronunciationUS"];
    
    NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] init];
    [dict2 setObject:@"American" forKey:@"Word"];
    [dict2 setObject:@"美洲人;(尤指)美国人" forKey:@"Translation"];
    [dict2 setObject:@"http://www.englishtown.com/etownresources/dictionary_mp3/Headword/US/A/American.mp3" forKey:@"AudioPath"];
    [dict2 setObject:@"noun" forKey:@"PartofSpeech"];
    [dict2 setObject:@"əˈmerɪkən" forKey:@"PhoneticPronunciationUK"];
    [dict2 setObject:@"əˈmerɪkən" forKey:@"PhoneticPronunciationUS"];
    
    NSMutableArray *a = [[NSMutableArray alloc] init];
    [a addObject:dict];
    [a addObject:dict2];
    
    // Sample of using 
    VocabularyDict *vDict = [VocabularyDict initWithObject:a];
    
    // test parsed resutl
    Vocabulary *v = [vDict objectForKey:@"afternoon"];
    Vocabulary *v2 = [vDict objectForKey:@"American"];
    
    NSLog(@"Vocabulary word is: %@", v.word);
    NSLog(@"Vocabulary word is: %@", v2.word);
}

@end
