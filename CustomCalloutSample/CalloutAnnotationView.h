//
//  CalloutAnnotationView.h
//  CustomCalloutSample
//
//  Created by tochi on 11/05/17.
//  Copyright 2011 aguuu,Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@protocol CalloutAnnotationViewDelegate;
@interface CalloutAnnotationView : MKAnnotationView
{
 @private
  NSString *title_;
  UILabel *titleLabel_;
  UIButton *button_;
}
@property (nonatomic, retain) NSString *title;
@property (nonatomic, assign) id<CalloutAnnotationViewDelegate> delegate;
@end

@protocol CalloutAnnotationViewDelegate
@required
- (void)calloutButtonClicked:(NSString *)title;
@end
