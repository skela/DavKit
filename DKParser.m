//
//  DKParser.m
//  DAVKIT
//
//  Created by Aleksander Slater on 09/06/2012.
//  Copyright (c) 2012 Davincium. All rights reserved.
//

#import "DKParser.h"

@implementation DKParser

+ (id)getObject:(NSDictionary*)d ofClass:(Class)classe forKey:(NSString*)key fallBack:(id)fallBack
{
    NSString *obj=[d objectForKey:key];
    if (obj!=nil && [obj isKindOfClass:classe])
        return obj;
    return fallBack;
}

+ (NSString*)getString:(NSDictionary*)d forKey:(NSString*)key fallBack:(NSString*)fallBack
{
    return [DKParser getObject:d ofClass:[NSString class] forKey:key fallBack:fallBack];
}

+ (NSArray*)getArray:(NSDictionary*)d forKey:(NSString*)key fallBack:(NSArray*)fallBack
{
    return [DKParser getObject:d ofClass:[NSArray class] forKey:key fallBack:fallBack];    
}

+ (NSDictionary*)getDictionary:(NSDictionary*)d forKey:(NSString*)key fallBack:(NSDictionary*)fallBack
{
    return [DKParser getObject:d ofClass:[NSDictionary class] forKey:key fallBack:fallBack];        
}

+ (NSInteger)getInteger:(NSDictionary*)d forKey:(NSString*)key fallBack:(NSInteger)fallBack
{
    NSNumber *n=[d objectForKey:key];
    if (n!=nil && [n isKindOfClass:[NSNumber class]])
        return [n integerValue];
    return fallBack;
}

+ (long long)getLongLong:(NSDictionary*)d forKey:(NSString*)key fallBack:(long long)fallBack
{
    NSNumber *n=[d objectForKey:key];
    if (n!=nil && [n isKindOfClass:[NSNumber class]])
        return [n longLongValue];
    return fallBack;
}

+ (BOOL)getBool:(NSDictionary*)d forKey:(NSString*)key fallBack:(BOOL)fallBack
{
    NSNumber *n=[d objectForKey:key];
    if (n!=nil && [n isKindOfClass:[NSNumber class]])
        return [n boolValue];
    return fallBack;
}

+ (double)getDouble:(NSDictionary*)d forKey:(NSString*)key fallBack:(double)fallBack
{
    NSNumber *n=[d objectForKey:key];
    if (n!=nil && [n isKindOfClass:[NSNumber class]])
        return [n doubleValue];
    return fallBack;
}

+ (CGFloat)getFloat:(NSDictionary*)d forKey:(NSString*)key fallBack:(CGFloat)fallBack
{
    NSNumber *n=[d objectForKey:key];
    if (n!=nil && [n isKindOfClass:[NSNumber class]])
        return [n floatValue];
    return fallBack;
}

+ (long)getLong:(NSDictionary*)d forKey:(NSString*)key fallBack:(long)fallBack
{
    NSNumber *n=[d objectForKey:key];
    if (n!=nil && [n isKindOfClass:[NSNumber class]])
        return [n longValue];
    return fallBack;
}

+ (BOOL)isDictionary:(id)d
{
    if (d!=nil && [d isKindOfClass:[NSDictionary class]])
        return YES;
    return NO;
}

+ (BOOL)isNumber:(id)number
{
    if (number!=nil && [number isKindOfClass:[NSNumber class]])
        return YES;
    return NO;
}

+ (BOOL)isString:(id)string
{
    if (string!=nil && [string isKindOfClass:[NSString class]] && [string length]>0)
        return YES;
    return NO;
}

+ (BOOL)isArray:(id)ar
{
    if (ar!=nil && [ar isKindOfClass:[NSArray class]])
        return YES;
    return NO;
}

// Specials

+ (double)getDoubleFromString:(NSDictionary*)d forKey:(NSString*)key startsWith:(NSString*)start endsWith:(NSString*)end fallBack:(double)fallBack
{
    NSString *s=[DKParser getString:d forKey:key fallBack:nil];
    if (s!=nil)
    {
        if (start!=nil && end!=nil)
        {
            if ([s hasPrefix:start] && [s hasSuffix:end])
            {
                NSRange rstart = [s rangeOfString:start];
                NSRange rend = [s rangeOfString:end];
                NSRange res; res.location = rstart.location+rstart.length; res.length=rend.location-res.location;
                NSString *numString = [s substringWithRange:res];
                return [numString doubleValue];
            }
        }
    }
    return fallBack;
}

// Convertors

+ (unsigned int)intFromHexString:(NSString *)hexStr
{
    unsigned int hexInt = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    return hexInt;
}

@end
