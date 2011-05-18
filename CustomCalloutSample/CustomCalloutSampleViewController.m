//
//  CustomCalloutSampleViewController.m
//  CustomCalloutSample
//
//  Created by tochi on 11/05/17.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import "CustomCalloutSampleViewController.h"


@interface CustomCalloutSampleViewController (Private)
- (void)releaseOutlets;
@end

@implementation CustomCalloutSampleViewController

- (void)dealloc
{
  [super dealloc];
  
  [self releaseOutlets];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (void)releaseOutlets
{
  [mapView_ release], mapView_ = nil;
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
  [super viewDidLoad];
    
  // MapView.
  mapView_ = [[MKMapView alloc] init];
  mapView_.delegate = self;
  mapView_.frame    = self.view.bounds;
  [self.view addSubview:mapView_];
  
  // Pin annotation.
  NSMutableArray *locationArray = [NSMutableArray arrayWithCapacity:0];
  [locationArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"Pin-1", @"title",
                             [NSNumber numberWithFloat:34.655146f],  @"lat",
                             [NSNumber numberWithFloat:133.919502f], @"lon", nil]];
  [locationArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                             @"Pin-2", @"title",
                             [NSNumber numberWithFloat:34.755146f],  @"lat",
                             [NSNumber numberWithFloat:133.819502f], @"lon", nil]];

  // Add annotations on the MapView.
  PinAnnotation *pinAnnotation;
  CLLocationCoordinate2D coordinate;
  for (NSDictionary *location in locationArray) {
    coordinate.latitude  = [[location objectForKey:@"lat"] floatValue];
    coordinate.longitude = [[location objectForKey:@"lon"] floatValue];
    
    pinAnnotation = [[PinAnnotation alloc] init];
    pinAnnotation.title      = (NSString *)[location objectForKey:@"title"];
    pinAnnotation.coordinate = coordinate;
    [mapView_ addAnnotation:pinAnnotation];
    [pinAnnotation release];
  }
  
  mapView_.region = MKCoordinateRegionMakeWithDistance(coordinate, 100000, 100000);
}

- (void)viewDidUnload
{
  [super viewDidUnload];

  [self releaseOutlets];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - MapView delegate.
- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id<MKAnnotation>)annotation
{  
  MKAnnotationView *annotationView;
  NSString *identifier;
  
  if ([annotation isKindOfClass:[PinAnnotation class]]) {
    // Pin annotation.
    identifier = @"Pin";
    annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (annotationView == nil) {
      annotationView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];
    }
  } else if ([annotation isKindOfClass:[CalloutAnnotation class]]) {
    // Callout annotation.
    identifier = @"Callout";
    annotationView = (CalloutAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (annotationView == nil) {
      annotationView = [[[CalloutAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];
    }
    
    CalloutAnnotation *calloutAnnotation = (CalloutAnnotation *)annotation;
    
    ((CalloutAnnotationView *)annotationView).title = calloutAnnotation.title;
    [annotationView setNeedsDisplay];
    
    // Move the display position of MapView.
    [UIView animateWithDuration:0.5f
                     animations:^(void) {
                       mapView.centerCoordinate = calloutAnnotation.coordinate;
                     }];
  }
  
  annotationView.annotation = annotation;  
  
  return annotationView;
}

- (void)mapView:(MKMapView *)mapView
    didSelectAnnotationView:(MKAnnotationView *)view
{
  if ([view.annotation isKindOfClass:[PinAnnotation class]]) {
    // Selected the pin annotation.
    CalloutAnnotation *calloutAnnotation = [[[CalloutAnnotation alloc] init] autorelease];
    
    PinAnnotation *pinAnnotation = ((PinAnnotation *)view.annotation);
    calloutAnnotation.title      = pinAnnotation.title;
    calloutAnnotation.coordinate = pinAnnotation.coordinate;
    pinAnnotation.calloutAnnotation = calloutAnnotation;
    
    [mapView addAnnotation:calloutAnnotation];
  }
}

- (void)mapView:(MKMapView *)mapView
    didDeselectAnnotationView:(MKAnnotationView *)view
{
  if ([view.annotation isKindOfClass:[PinAnnotation class]]) {
    // Deselected the pin annotation.
    PinAnnotation *pinAnnotation = ((PinAnnotation *)view.annotation);
    
    [mapView removeAnnotation:pinAnnotation.calloutAnnotation];
    
    pinAnnotation.calloutAnnotation = nil;
  }  
}

@end
