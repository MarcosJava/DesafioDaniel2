//
//  PreferenciaUsuarioUtil.m
//  DanielDesafio2
//
//  Created by Marcos Felipe Souza on 25/04/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

#import "PreferenciaUsuarioUtil.h"

@implementation PreferenciaUsuarioUtil

- (void)saveCustomObject:(NSString *)object key:(NSString *)key {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
    
}

- (NSString *)loadCustomObjectWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    NSString *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

@end
