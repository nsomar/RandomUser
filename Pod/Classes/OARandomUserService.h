//
//  OARandomUserService.h
//  Pods
//
//  Created by Omar Abdelhafith on 26/12/2014.
//
//

#import <Foundation/Foundation.h>
#import "OARandomUser.h"

typedef void (^RandomUserServiceHandler)(OARandomUser *user);
typedef void (^MultipleRandomUserServiceHandler)(NSArray *users);

@interface OARandomUserService : NSObject

/**
 *  Perform an HTTP request to fetch a new user
 *  @param handler Handler will be called on the main thread
 */
+ (void)requestRandomUser:(RandomUserServiceHandler)handler;

/**
 *  Perform an HTTP request to fetch a new user of f the passed gender
 *  @param gender  The gender of the user to fetch
 *  @param handler Handler will be called on the main thread
 */
+ (void)requestRandomUserWithGender:(OARandomUserGender)gender handler:(RandomUserServiceHandler)handler;

/**
 *  Perform an HTTP request to fetch a new user of f the passed gender
 *  @param seed  Seeds allow you to always generate the same user
 *  @param handler Handler will be called on the main thread
 */
+ (void)requestRandomUserWithSeed:(NSString*)seed handler:(RandomUserServiceHandler)handler;

/**
 *  Perform an HTTP request to fetch a new user of f the passed gender
 *  @param count  The number of users to fetch
 *  @param handler Handler will be called on the main thread
 */
+ (void)requestRandomUserWithCount:(NSInteger)count handler:(MultipleRandomUserServiceHandler)handler;

@end
