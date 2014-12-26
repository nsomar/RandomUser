//
//  OARandomUserService.m
//  Pods
//
//  Created by Omar Abdelhafith on 26/12/2014.
//
//

#import "OARandomUserService.h"

@implementation OARandomUserService

+ (void)requestRandomUser:(RandomUserServiceHandler)handler {
  [self fetchRandomUserWithURL:[NSURL URLWithString:@"http://api.randomuser.me/"] handler:^(NSArray *users) {
    if (handler) {
      handler([users firstObject]);
    }
  }];
}

+ (void)requestRandomUserWithGender:(OARandomUserGender)gender handler:(RandomUserServiceHandler)handler {
  NSString *urlString = [NSString stringWithFormat:@"http://api.randomuser.me/%@", [self queryStringForGender:gender]];
  [self fetchRandomUserWithURL:[NSURL URLWithString:urlString] handler:^(NSArray *users) {
    if (handler) {
      handler([users firstObject]);
    }
  }];
}

+ (void)requestRandomUserWithSeed:(NSString*)seed handler:(RandomUserServiceHandler)handler {
  NSString *urlString = [NSString stringWithFormat:@"http://api.randomuser.me/?seed=%@", seed];
  [self fetchRandomUserWithURL:[NSURL URLWithString:urlString] handler:^(NSArray *users) {
    if (handler) {
      handler([users firstObject]);
    }
  }];
}

+ (void)requestRandomUserWithCount:(NSInteger)count handler:(MultipleRandomUserServiceHandler)handler {
  NSString *urlString = [NSString stringWithFormat:@"http://api.randomuser.me/?results=%ld", (long)count];
  [self fetchRandomUserWithURL:[NSURL URLWithString:urlString] handler:handler];
}

+ (void)fetchRandomUserWithURL:(NSURL*)url handler:(MultipleRandomUserServiceHandler)handler {
  NSURLSession *session = [NSURLSession sharedSession];
  
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  
  [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  
  [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    
    id dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([dic isKindOfClass:[NSDictionary class]] && dic[@"results"]) {
      NSArray *results = dic[@"results"];
      if ([results count] > 0) {
        
        if (handler) {
          dispatch_async(dispatch_get_main_queue(), ^{
            handler([self parseResults:results]);
          });
        }
        
        return;
      }
    }
    
    if (handler) {
      handler(nil);
    }
    
  }] resume];
}

+ (NSArray*)parseResults:(NSArray*)results {
  NSMutableArray *users = [@[] mutableCopy];
  
  for (NSDictionary *dic in results) {
    NSDictionary *userDictionary = [dic valueForKey:@"user"];
    OARandomUser *randomUser = [[OARandomUser alloc] initWithDictionary:userDictionary];
    
    [users addObject:randomUser];
  }
  
  return [users copy];
}

+ (NSString*)queryStringForGender:(OARandomUserGender)gender {
  switch (gender) {
    case OARandomUserGenderFemale:
      return @"?gender=female";
      break;
    case OARandomUserGenderMale:
      return @"?gender=male";
      break;
    case OARandomUserGenderUnknown:
      return @"";
      break;
    default:
      abort();
      break;
  }
}

@end
