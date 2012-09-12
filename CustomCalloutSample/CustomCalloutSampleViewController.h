//
//  CustomCalloutSampleViewController.h
//  CustomCalloutSample
//
//  Created by tochi on 11/05/17.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PinAnnotation.h"
#import "CalloutAnnotation.h"
#import "CalloutAnnotationView.h"

@interface CustomCalloutSampleViewController : UIViewController <MKMapViewDelegate,
CalloutAnnotationViewDelegate>
{
 @private
  MKMapView *mapView_;
}

@end
