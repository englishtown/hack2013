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
    [self pullVocabularyDataOfUnitId:383 withCulture:@"zh-CN"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pullVocabularyDataOfUnitId:(int)unit_id withCulture:(NSString *)cultureCode
{
    NSString *url = [NSString stringWithFormat:@"http://%@/hackthon/Overview/Unit/Unitoverview/LoadUnitOverviewInfo/?unit_id=%d&cultureCode=%@", SERVER_DOMAIN, unit_id, cultureCode];
    
    dispatch_queue_t pullVocabulary = dispatch_queue_create("vocabulary", NULL);
    dispatch_async(pullVocabulary, ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString: url]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
        [self performSelectorOnMainThread:@selector(fetchedVocabularyData:)
                               withObject:data waitUntilDone:YES];
        });
    });
    dispatch_release(pullVocabulary);
}

- (void)fetchedVocabularyData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary *json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    NSArray *jsonArray = [json objectForKey:@"Words"];
    VocabularyDict *vDict = [VocabularyDict initWithObject:jsonArray];
    
    Vocabulary *voc = [vDict objectForKey:[[vDict allKeys] objectAtIndex:0]];
    NSLog(@"first vocabulary word is:%@ , translation: %@", voc.word, voc.translation);
}

@end
