//
//  Banda.m
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 07/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "Banda.h"

@implementation Banda

@synthesize nome = _nome;
@synthesize foto = _foto;

-(id)initWithNome: (NSString *) nome eFoto:(UIImage *)foto {
    
    self = [super init];
    if (self){
        self.nome = nome;
        self.foto = foto;
    }
    return self;
}

@end
