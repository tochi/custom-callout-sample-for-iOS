//
//  PinAnnotation.m
//  CustomCalloutSample
//
//  Created by tochi on 11/05/17.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import "PinAnnotation.h"


@implementation PinAnnotation
@synthesize title=title_;
@synthesize coordinate=coordinate_;
@synthesize calloutAnnotation=calloutAnnotation_;

- (void)dealloc
{
  [title_ release], title_ = nil;
  [calloutAnnotation_ release], calloutAnnotation_ = nil;
  [super dealloc];
}
@end
