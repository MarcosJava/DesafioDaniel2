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
    _activyPin = NO;
    [self alertStart];
    [self configLocationManager];
    [self configLocalUser];
    [self configMap];
    [self addGestureRecognize];
    
}

-(void) alertStart {
    _preferenciaUsuarioUtil = [PreferenciaUsuarioUtil new];
    
    if (![_preferenciaUsuarioUtil loadCustomObjectWithKey:@"start"]) {
        [_preferenciaUsuarioUtil saveCustomObject:@"yes" key:@"start"];
        [self exibirAlert:@"ATENCAO" eComMensagem:@"Sou Foda !"];
    }
}

-(void) configMap {
    _mapa.delegate = self;
    _mapa.showsUserLocation = YES;
}

-(void) configLocalUser{
    CLLocationCoordinate2D coordinate = _mapa.userLocation.coordinate;
    CLLocationDistance distancia = 50;
    MKCoordinateRegionMakeWithDistance(coordinate, distancia, distancia);
}

-(void) configLocationManager{
    _locationManager = [CLLocationManager new];
    _locationManager.delegate = self;
    [_locationManager requestWhenInUseAuthorization]; //Autorizacao da localidade do usuario
    [_locationManager startUpdatingLocation]; //Inicia a busca da localizacao do usuario
}

/**
 **** Exibe Alerta + Pode ser Util
 */
-(void) exibirAlert:(NSString*) titulo eComMensagem:(NSString *) mensagem {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:titulo
                                                                   message:mensagem
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

/***
 ZOOM para a localizacao do usuario
 ***/
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"mudou !");
    CLLocationDistance distancia = 80;
    MKCoordinateRegion mapRegion = MKCoordinateRegionMakeWithDistance(mapView.userLocation.coordinate, distancia, distancia);
    [mapView setRegion:mapRegion animated: YES];
}


/***
 ZOOM para os annotation, dar o zoom onde estiver pino ou sua localizacao
 ***/
-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views {
    
    // Validacao para nao ficar toda hora dando zoom no pino
    if (_activyPin) {
        MKAnnotationView *view = [views objectAtIndex:0];
        CLLocationDistance distancia = 50;
        MKCoordinateRegion regiao = MKCoordinateRegionMakeWithDistance([view.annotation coordinate], distancia, distancia);
        _activyPin = NO;
        [self.mapa setRegion:regiao animated:YES];
    }
    
}

/***
 Configuracao inicial para acoes de reconhecimento de gesto
 ***/
-(void) addGestureRecognize {
    UILongPressGestureRecognizer *toqueLongo = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(adicionaPino:)];
    toqueLongo.minimumPressDuration = 1;
    [self.mapa addGestureRecognizer:toqueLongo];
}


/***
 Mensagem que esta sendo executada pelo @selector do GestureRecognize
 ***/
- (void) adicionaPino: (UIGestureRecognizer *) gesto {
    
    if (gesto.state == UIGestureRecognizerStateBegan) {
        
        //Pega o ponto do gesto na view
        CGPoint ponto = [gesto locationInView:self.view];
        
        //Converte a posicao do toque para coordenada no mapa
        CLLocationCoordinate2D coordenadas = [self.mapa convertPoint:ponto toCoordinateFromView:self.mapa];
        
        //Cria o pino e sua coordenada
        MKPointAnnotation *pino = [MKPointAnnotation new];
        pino.coordinate = coordenadas;
        
        _activyPin = YES;
        
        //Adiciona o pino no mapa
        [self.mapa addAnnotation:pino];
    }
}

/***
    Recebe um Tap no Pin
 **/
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    NSLog(@"Pino %@ selecionado", view);
    [view removeFromSuperview];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
