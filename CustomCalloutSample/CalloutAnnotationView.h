//
//  CalloutAnnotationView.h
//  CustomCalloutSample
//
//  Created by tochi on 11/05/17.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface CalloutAnnotationView : MKAnnotationView
{
 @private
  NSString *title_;
  UILabel *titleLabel_;
}
@property (nonatomic, retain) NSString *title;

@end
