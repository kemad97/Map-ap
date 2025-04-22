//
//  ViewController.m
//  Map
//
//  Created by Kerolos on 22/04/2025.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"

#import <CoreLocation/CoreLocation.h>


@interface ViewController ()
@property (nonatomic, strong) MyAnnotation *currentLocationAnnotation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mapView.delegate=self;
    _mapView.showsUserLocation=YES;
//
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager requestWhenInUseAuthorization];

    
    UITapGestureRecognizer *tabGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleMapClick:)];
    [self.mapView addGestureRecognizer:tabGesture];



}

- (void)locationManagerDidChangeAuthorization:(CLLocationManager *)manager{

    CLAuthorizationStatus status = manager.authorizationStatus;

    if(status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways){
        
        [self.locationManager startUpdatingLocation];
    }
    
        
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations lastObject]; //
    
    //zoomm
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000);
    [self.mapView setRegion:region animated:YES];
    
    
    MyAnnotation *annotation = [[MyAnnotation alloc] init] ;
    if (self.currentLocationAnnotation) {
        [self.currentLocationAnnotation setCoordinate:location.coordinate];
    } else {
        self.currentLocationAnnotation = [[MyAnnotation alloc] init];
        self.currentLocationAnnotation.coordinate = location.coordinate;
        self.currentLocationAnnotation.title = @"My Location";
        [self.mapView addAnnotation:self.currentLocationAnnotation];
    }

}

-(void)handleMapClick :(UITapGestureRecognizer*)gestureRecognizer{
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    NSMutableArray *annotationsToRemove = [NSMutableArray array];
    for (id<MKAnnotation> annotation in self.mapView.annotations)
    {
            [annotationsToRemove addObject:annotation];
        
    }
    [self.mapView removeAnnotations:annotationsToRemove];
    
    MyAnnotation *annotation = [[MyAnnotation alloc] init] ;
    annotation.coordinate=coordinate;
    annotation.title=@"Selected Loc";
    
    
    [self.mapView addAnnotation:annotation];

    
    
}


@end
