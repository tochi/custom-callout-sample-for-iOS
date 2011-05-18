//
//  CalloutAnnotation.m
//  CustomCalloutSample
//
//  Created by tochi on 11/05/17.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import "CalloutAnnotation.h"


@implementation CalloutAnnotation
@synthesize title=title_;
@synthesize coordinate=coordinate_;

- (void)dealloc
{
  [title_ release], title_ = nil;
  [super dealloc];
}
@end
