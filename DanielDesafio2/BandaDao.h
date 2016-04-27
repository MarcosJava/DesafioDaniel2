//
//  BandaDao.h
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 23/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Banda.h"

@interface BandaDao : NSObject

@property (strong, readonly) NSMutableArray *bandas;
@property (strong, readonly) NSMutableArray *bandasPreferidas;

+ (id) bandaDaoInstance;
- (Banda *) buscaBandaPor: (int) indice;
- (Banda *) buscaBandaPreferidaPor: (int) indice;
- (void) removeBanda: (int) indice;
- (void) addBandaPreferida: (int) indiceDaBanda;
- (int) countOfBandas;
- (int) countOfBandasPreferidas;
@end
