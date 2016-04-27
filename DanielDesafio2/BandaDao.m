//
//  BandaDao.m
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 23/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "BandaDao.h"
#import "Banda.h"

@implementation BandaDao


@synthesize bandas = _bandas;

static BandaDao *defaultBandaDao = nil;

+(id) bandaDaoInstance {
    if (!defaultBandaDao) {
        defaultBandaDao = [[BandaDao alloc] init];
    }
    return defaultBandaDao;
}

-(id) init {
    self = [super init];
    if(self){
        _bandas = [NSMutableArray new];
        _bandasPreferidas = [NSMutableArray new];
        [self popularBandas];
    }
    return self;
}


/****
    Populando as bandas para carregar nas views
 ***/
-(void) popularBandas {
    Banda *nirvana = [[Banda alloc]initWithNome:@"Nirvana" eFoto:[UIImage imageNamed:@"nirvana.jpg"]];
    Banda *coldplay = [[Banda alloc]initWithNome:@"Coldplay" eFoto:[UIImage imageNamed:@"coldplay.jpg"]];
    Banda *livresParaAdorar = [[Banda alloc]initWithNome:@"Livres Para Adorar" eFoto:[UIImage imageNamed:@"livresParaAdorar.jpg"]];
    Banda *marron = [[Banda alloc]initWithNome:@"Morron 5" eFoto:[UIImage imageNamed:@"maroon5.jpeg"]];
    Banda *metalica = [[Banda alloc]initWithNome:@"Metalica" eFoto:[UIImage imageNamed:@"metalica.jpg"]];
    Banda *nxZero = [[Banda alloc]initWithNome:@"NX Zero" eFoto:[UIImage imageNamed:@"nxZero.jpeg"]];
    Banda *redHotChilipeppers = [[Banda alloc]initWithNome:@"Red Hot Chilipeppers" eFoto:[UIImage imageNamed:@"redhotChilipeppers.png"]];
    Banda *slipknot = [[Banda alloc]initWithNome:@"Slipknot" eFoto:[UIImage imageNamed:@"slipknot.jpg"]];
    Banda *thridDay = [[Banda alloc]initWithNome:@"3Th Day" eFoto:[UIImage imageNamed:@"thridDay.png"]];
    Banda *wesleySafadao = [[Banda alloc]initWithNome:@"Wesley Safadao" eFoto:[UIImage imageNamed:@"wesleySafadao.jpg"]];
    
    [_bandas addObject:nirvana];
    [_bandas addObject:coldplay];
    [_bandas addObject:livresParaAdorar];
    [_bandas addObject:marron];
    [_bandas addObject:metalica];
    [_bandas addObject:nxZero];
    [_bandas addObject:redHotChilipeppers];
    [_bandas addObject:slipknot];
    [_bandas addObject:thridDay];
    [_bandas addObject:wesleySafadao];
}


/***
    Pegar dados pelo indice
 ***/
- (Banda *) buscaBandaPor: (int) indice{
    return [_bandas objectAtIndex:indice];
}
- (Banda *) buscaBandaPreferidaPor: (int) indice{
    return [_bandasPreferidas objectAtIndex:indice];
}


/****
    Remover banda
 ****/
-(void) removeBanda: (int) indice {
    [_bandas removeObjectAtIndex:indice];
}


/***
    Adicionar banda preferida
 ****/
- (void) addBandaPreferida: (int) indiceDaBanda {
    Banda *banda = [self buscaBandaPor:indiceDaBanda];
    [self removeBanda:indiceDaBanda];
    [_bandasPreferidas addObject:banda];
}


/***
    Retorna o tamanho dos arrays
****/
- (int) countOfBandas{
    NSNumber *number = [NSNumber numberWithInteger:[_bandas count]]; //Remover Warning
    return [number intValue];
}
- (int) countOfBandasPreferidas{
    NSNumber *number = [NSNumber numberWithInteger:[_bandasPreferidas count]]; //Remover Warning
    return [number intValue];

}


@end
