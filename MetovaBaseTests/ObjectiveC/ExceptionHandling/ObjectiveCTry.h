//
//  ObjectiveCTry.h
//  MetovaBase
//
//  Created by Nick Griffith on 4/23/16.
//
//

#import <Foundation/Foundation.h>

@interface ObjCTry : NSObject

+ (NSException * _Nullable)executeBlock:(__attribute__((noescape)) void (^ _Nonnull)(void))block;

@end
