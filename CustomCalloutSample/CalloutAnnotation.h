//
//  CalloutAnnotation.h
//  CustomCalloutSample
//
//  Created by tochi on 11/05/17.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface CalloutAnnotation : NSObject <MKAnnotation>
{
@private
  NSString *title_;
  CLLocationCoordinate2D coordinate_;
}
@property (nonatomic, retain) NSString *title;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
