//
//  Vocabulary.m
//  EFHack2013
//
//  Created by Yongwei on 18/4/13.
//  Copyright (c) 2013 zhangkai. All rights reserved.
//

#import "Vocabulary.h"

@implementation Vocabulary

+(Vocabulary *) initWithObject:(NSDictionary *)obj
{
    Vocabulary *result = [[Vocabulary alloc] init];
    
    result.word = [obj objectForKey:@"Word"];
    result.translation = [obj objectForKey:@"Translation"];
    result.audioPath = [obj objectForKey:@"AudioPath"];
    result.partOfSpeech = [obj objectForKey:@"PartofSpeech"];
    result.pronunciationUK = [obj objectForKey:@"PhoneticPronunciationUK"];
    result.pronunciationUS = [obj objectForKey:@"PhoneticPronunciationUS"];
    
    return result;
}

@end
