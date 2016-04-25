//
//  UIImageView.m
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 25/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "UIImageView.h"

@implementation UIImageView(Adicoes)

-(UIImageView*) arredondarFoto: (UIImageView*)imageView eComTamanho:(float)tamanho{
    CGRect frame = [imageView frame];
    frame.size.width = tamanho;
    [imageView setFrame:frame];
    return imageView;
}

@end
