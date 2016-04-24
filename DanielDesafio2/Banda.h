//
//  Banda.h
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 07/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Banda : NSObject

-(id)initWithNome: (NSString *) nome eFoto:(UIImage *)foto;

@property NSString *nome;
@property UIImage *foto;

@end
