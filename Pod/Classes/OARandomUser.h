//
//  OARandomUser.h
//  Pods
//
//  Created by Omar Abdelhafith on 26/12/2014.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, OARandomUserGender) {
  OARandomUserGenderUnknown,
  OARandomUserGenderMale,
  OARandomUserGenderFemale,
};

@class OARandomUserName, OARandomUserLocation, OARandomUserPicture;

@interface OARandomUser : NSObject

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@property (nonatomic, assign) OARandomUserGender gender;

@property (nonatomic, strong) OARandomUserName *name;
@property (nonatomic, strong) OARandomUserLocation *location;
@property (nonatomic, strong) OARandomUserPicture *picture;

@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, copy) NSString *salt;
@property (nonatomic, copy) NSString *md5;
@property (nonatomic, copy) NSString *sha1;
@property (nonatomic, copy) NSString *sha256;
@property (nonatomic, copy) NSString *registered;

@property (nonatomic, copy) NSString *dob;

@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *cell;
@property (nonatomic, copy) NSString *SSN;

@property (nonatomic, copy) NSString *version;

@end

@interface OARandomUserName : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *first;
@property (nonatomic, copy) NSString *last;

@end

@interface OARandomUserLocation : NSObject

@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *zip;

@end

@interface OARandomUserPicture : NSObject

@property (nonatomic, copy) NSString *large;
@property (nonatomic, copy) NSString *medium;
@property (nonatomic, copy) NSString *thumbnail;

@end