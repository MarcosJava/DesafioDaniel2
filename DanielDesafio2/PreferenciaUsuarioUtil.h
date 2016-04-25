//
//  PreferenciaUsuarioUtil.h
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 25/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PreferenciaUsuarioUtil : NSObject
- (void)saveCustomObject:(NSString *)object key:(NSString *)key;
- (NSString *)loadCustomObjectWithKey:(NSString *)key;
@end
