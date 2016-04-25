//
//  UIView.m
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 24/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "UIView.h"

@implementation UIView(Adicoes)

-(void) setX:(float) novoX {
    CGRect frame = self.frame;
    frame.origin.x = novoX;
    self.frame = frame;
}

-(float) x {
    return self.frame.origin.x;
}



@end
