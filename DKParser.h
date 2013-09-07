//
//  DKParser.h
//  DAVKIT
//
//  Created by Aleksander Slater on 09/06/2012.
//  Copyright (c) 2012 Davincium. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKParser : NSObject

+ (NSString*)getString:(NSDictionary*)d forKey:(NSString*)key fallBack:(NSString*)fallBack;
+ (NSInteger)getInteger:(NSDictionary*)d forKey:(NSString*)key fallBack:(NSInteger)fallBack;
+ (BOOL)getBool:(NSDictionary*)d forKey:(NSString*)key fallBack:(BOOL)fallBack;
+ (double)getDouble:(NSDictionary*)d forKey:(NSString*)key fallBack:(double)fallBack;
+ (CGFloat)getFloat:(NSDictionary*)d forKey:(NSString*)key fallBack:(CGFloat)fallBack;
+ (NSArray*)getArray:(NSDictionary*)d forKey:(NSString*)key fallBack:(NSArray*)fallBack;
+ (NSDictionary*)getDictionary:(NSDictionary*)d forKey:(NSString*)key fallBack:(NSDictionary*)fallBack;
+ (long)getLong:(NSDictionary*)d forKey:(NSString*)key fallBack:(long)fallBack;
+ (long long)getLongLong:(NSDictionary*)d forKey:(NSString*)key fallBack:(long long)fallBack;

+ (BOOL)isDictionary:(id)d;
+ (BOOL)isNumber:(id)number;
+ (BOOL)isString:(id)string;
+ (BOOL)isArray:(id)ar;

@end
