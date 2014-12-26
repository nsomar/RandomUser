//
//  RandomUserTests.m
//  RandomUserTests
//
//  Created by Omar Abdelhafith on 12/26/2014.
//  Copyright (c) 2014 Omar Abdelhafith. All rights reserved.
//
#import <OARandomUserService.h>

SpecBegin(OARandomUserServiceSpec)

describe(@"OARandomUser", ^{
  it(@"can be initialized from a json", ^{
    NSString *jsonPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"sample_user" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    id dic = [[[NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil] valueForKey:@"results"] firstObject];
    
    OARandomUser *user = [[OARandomUser alloc] initWithDictionary:dic[@"user"]];
    
    expect(user.gender).to.equal(OARandomUserGenderFemale);
    
    expect(user.name.title).to.equal(@"ms");
    expect(user.name.first).to.equal(@"lois");
    expect(user.name.last).to.equal(@"williams");
    
    expect(user.location.street).to.equal(@"1969 elgin st");
    expect(user.location.city).to.equal(@"frederick");
    expect(user.location.state).to.equal(@"delaware");
    expect(user.location.zip).to.equal(@"56298");
    
    expect(user.email).to.equal(@"lois.williams50@example.com");
    expect(user.username).to.equal(@"heavybutterfly920");
    expect(user.password).to.equal(@"enterprise");
    
    expect(user.salt).to.equal(@">egEn6YsO");
    expect(user.md5).to.equal(@"2dd1894ea9d19bf5479992da95713a3a");
    expect(user.sha1).to.equal(@"ba230bc400723f470b68e9609ab7d0e6cf123b59");
    expect(user.sha256).to.equal(@"f4f52bf8c5ad7fc759d1d4156b25a4c7b3d1e2eec6c92d80e508aa0b7946d4ba");
    expect(user.registered).to.equal(@"1288182167");
    
    expect(user.dob).to.equal(@"146582153");
    expect(user.phone).to.equal(@"(555)-942-1322");
    expect(user.cell).to.equal(@"(178)-341-1520");
    expect(user.SSN).to.equal(@"137-37-8866");
    
    expect(user.picture.large).to.equal(@"http://api.randomuser.me/portraits/women/55.jpg");
    expect(user.picture.medium).to.equal(@"http://api.randomuser.me/portraits/med/women/55.jpg");
    expect(user.picture.thumbnail).to.equal(@"http://api.randomuser.me/portraits/thumb/women/55.jpg");
    
    expect(user.version).to.equal(@"0.4.1");
    
  });
});

describe(@"OARandomUserService", ^{
  
  it(@"can fetch a random user", ^AsyncBlock {
    [OARandomUserService requestRandomUser:^(OARandomUser *user) {
      expect(user).notTo.beNil;
      expect(user.name).notTo.beNil;
      expect(user.location).notTo.beNil;
      expect(user.picture).notTo.beNil;
      expect(user.username).notTo.beNil;
      expect(user.password).notTo.beNil;
      done();
    }];
  });
  
  it(@"can fetch a random female", ^AsyncBlock {
    [OARandomUserService requestRandomUserWithGender:OARandomUserGenderFemale handler:^(OARandomUser *user) {
      expect(user.gender).to.equal(OARandomUserGenderFemale);
      done();
    }];
  });
  
  it(@"can fetch a random male", ^AsyncBlock {
    [OARandomUserService requestRandomUserWithGender:OARandomUserGenderMale handler:^(OARandomUser *user) {
      expect(user.gender).to.equal(OARandomUserGenderMale);
      done();
    }];
  });
  
  it(@"can fetch a random user with a specified seed", ^AsyncBlock {
    [OARandomUserService requestRandomUserWithSeed:@"foobar" handler:^(OARandomUser *user) {
      expect(user.name.title).to.equal(@"mr");
      expect(user.name.first).to.equal(@"earl");
      expect(user.name.last).to.equal(@"garza");
      done();
    }];
    
    [OARandomUserService requestRandomUserWithSeed:@"foobar" handler:^(OARandomUser *user) {
      expect(user.name.title).to.equal(@"mr");
      expect(user.name.first).to.equal(@"earl");
      expect(user.name.last).to.equal(@"garza");
      done();
    }];
    
    [OARandomUserService requestRandomUserWithSeed:@"foobar" handler:^(OARandomUser *user) {
      expect(user.name.title).to.equal(@"mr");
      expect(user.name.first).to.equal(@"earl");
      expect(user.name.last).to.equal(@"garza");
      done();
    }];
  });
  
  it(@"can fetch 5 users at once", ^AsyncBlock {
    [OARandomUserService requestRandomUserWithCount:5 handler:^(NSArray *users) {
      expect(users.count).to.equal(5);
      expect(users[0]).to.beKindOf([OARandomUser class]);
      expect(users[1]).to.beKindOf([OARandomUser class]);
      expect(users[2]).to.beKindOf([OARandomUser class]);
      expect(users[3]).to.beKindOf([OARandomUser class]);
      expect(users[4]).to.beKindOf([OARandomUser class]);
      
      expect([users[0] username]).notTo.beNil;
      expect([users[1] username]).notTo.beNil;
      expect([users[2] username]).notTo.beNil;
      expect([users[3] username]).notTo.beNil;
      expect([users[4] username]).notTo.beNil;
      done();
    }];
  });
  
});

SpecEnd
