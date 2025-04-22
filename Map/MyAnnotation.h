//
//  MyAnnotation.h
//  Map
//
//  Created by Kerolos on 22/04/2025.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyAnnotation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;



@end

NS_ASSUME_NONNULL_END
