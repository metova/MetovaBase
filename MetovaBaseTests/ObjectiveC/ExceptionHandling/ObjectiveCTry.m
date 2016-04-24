//
//  ObjectiveCTry.m
//  MetovaBase
//
//  Created by Nick Griffith on 4/23/16.
//
//

#import "ObjectiveCTry.h"

@implementation ObjCTry

+ (NSException * _Nullable)executeBlock:(__attribute__((noescape)) void (^ _Nonnull)(void))block {
    @try {
        block();
        return nil;
    } @catch (NSException *exception) {
        return exception;
    }
}

@end
