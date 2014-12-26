//
//  OARandomUser.m
//  Pods
//
//  Created by Omar Abdelhafith on 26/12/2014.
//
//

#import "OARandomUser.h"

@implementation OARandomUser

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
  self = [super init];
  if (self) {
    _gender = [self genderForString:dictionary[@"gender"]];
    _name = [self userNameWithDictionary:dictionary[@"name"]];
    _location = [self userLocationWithDictionary:dictionary[@"location"]];
    _picture = [self userPictureWithDictionary:dictionary[@"picture"]];
    
    _email = dictionary[@"email"];
    _username = dictionary[@"username"];
    _password = dictionary[@"password"];
    
    _salt = dictionary[@"salt"];
    _md5 = dictionary[@"md5"];
    _sha1 = dictionary[@"sha1"];
    _sha256 = dictionary[@"sha256"];
    _registered = dictionary[@"registered"];
    
    _dob = dictionary[@"dob"];
    
    _phone = dictionary[@"phone"];
    _cell = dictionary[@"cell"];
    _SSN = dictionary[@"SSN"];
    
    _version = dictionary[@"version"];
  }
  return self;
}

- (OARandomUserGender)genderForString:(NSString*)string {
  if ([[string lowercaseString] isEqualToString:@"female"]) {
    return OARandomUserGenderFemale;
  } else if ([[string lowercaseString] isEqualToString:@"male"]) {
    return OARandomUserGenderMale;
  }
  
  return OARandomUserGenderUnknown;
}

- (OARandomUserName*)userNameWithDictionary:(NSDictionary*)dictionary {
  OARandomUserName *user = [OARandomUserName new];
  user.title = dictionary[@"title"];
  user.first = dictionary[@"first"];
  user.last = dictionary[@"last"];
  return user;
}

- (OARandomUserLocation*)userLocationWithDictionary:(NSDictionary*)dictionary {
  OARandomUserLocation *location = [OARandomUserLocation new];
  location.street = dictionary[@"street"];
  location.city = dictionary[@"city"];
  location.state = dictionary[@"state"];
  location.zip = dictionary[@"zip"];
  return location;
}

- (OARandomUserPicture*)userPictureWithDictionary:(NSDictionary*)dictionary {
  OARandomUserPicture *picture = [OARandomUserPicture new];
  picture.thumbnail = dictionary[@"thumbnail"];
  picture.medium = dictionary[@"medium"];
  picture.large = dictionary[@"large"];
  return picture;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"User name:%@ %@ %@", self.name.title, self.name.first, self.name.last];
}

@end

@implementation OARandomUserName
@end

@implementation OARandomUserLocation
@end

@implementation OARandomUserPicture
@end