//
//  ViewController.h
//  Map
//
//  Created by Kerolos on 22/04/2025.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController <MKMapViewDelegate , CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property CLLocationManager *locationManager;

@end

