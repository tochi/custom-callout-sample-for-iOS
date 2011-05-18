//
//  CalloutAnnotationView.m
//  CustomCalloutSample
//
//  Created by tochi on 11/05/17.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import "CalloutAnnotationView.h"


@implementation CalloutAnnotationView
@synthesize title=title_;

- (id)initWithAnnotation:(id<MKAnnotation>)annotation
         reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
  
  if (self) {
    self.frame = CGRectMake(0.0f, 0.0f, 100.0f, 200.0f);
//    self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
    self.backgroundColor = [UIColor clearColor];
    
    titleLabel_ = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 50.0f)];
    titleLabel_.textColor       = [UIColor whiteColor];
    titleLabel_.textAlignment   = UITextAlignmentCenter;
    titleLabel_.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f];
    [self addSubview:titleLabel_];
  }
  
  return self;
}

- (void)dealloc
{
  [title_ release], title_ = nil;
  [titleLabel_ release], titleLabel_ = nil;
  
  [super dealloc];
}

-(void)drawRect:(CGRect)rect
{
  [super drawRect:rect];
  titleLabel_.text = self.title;
}
@end
