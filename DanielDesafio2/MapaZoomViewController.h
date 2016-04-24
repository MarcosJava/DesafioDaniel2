//
//  MapaZoomViewController.h
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 23/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapaZoomViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property CLLocationManager *locationManager;


@end
