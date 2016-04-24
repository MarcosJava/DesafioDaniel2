//
//  MapaZoomViewController.m
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 23/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "MapaZoomViewController.h"

@interface MapaZoomViewController ()

@end

@implementation MapaZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configLocationManager];
    [self configMap];
    [self configLocalUser];
    
}

-(void) configMap {
    _mapa.delegate = self;
    _mapa.showsUserLocation = YES;
}

-(void) configLocalUser{
    CLLocationCoordinate2D coordinate = _mapa.userLocation.coordinate;
    CLLocationDistance distancia = 100;
    MKCoordinateRegionMakeWithDistance(coordinate, distancia, distancia);
}

-(void) configLocationManager{
    _locationManager = [CLLocationManager new];
    _locationManager.delegate = self;
    [_locationManager requestWhenInUseAuthorization]; //Autorizacao da localidade do usuario
    [_locationManager startUpdatingLocation]; //Inicia a busca da localizacao do usuario
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
