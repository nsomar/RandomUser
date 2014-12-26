# RandomUser

[![CI Status](http://img.shields.io/travis/Omar Abdelhafith/RandomUser.svg?style=flat)](https://travis-ci.org/Omar Abdelhafith/RandomUser)
[![Version](https://img.shields.io/cocoapods/v/RandomUser.svg?style=flat)](http://cocoadocs.org/docsets/RandomUser)
[![License](https://img.shields.io/cocoapods/l/RandomUser.svg?style=flat)](http://cocoadocs.org/docsets/RandomUser)
[![Platform](https://img.shields.io/cocoapods/p/RandomUser.svg?style=flat)](http://cocoadocs.org/docsets/RandomUser)

iOS library for to generate random users, using https://randomuser.me/

<p align="center"><img src ="http://i1348.photobucket.com/albums/p740/o_abdelhafith/rnd_zpsyeb4amjw.gif" /></p>

## Installation

RandomUser is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "RandomUser"        
    
## Usage

`OARandomUserService` provides four different methods to fetch a random user.

Return any random user:

	[OARandomUserService requestRandomUser:] 

Return a random user with the specified gender:

	[OARandomUserService requestRandomUserWithGender:handler:]
  
Return a user using a predefined seed, this allow you to always generate the same user:

	[OARandomUserService requestRandomUserWithSeed:handler:]

Return a specific number of random users:

	[OARandomUserService requestRandomUserWithCount:handler:]


## Author

Omar Abdelhafith, o.arrabi@me.com

## License

RandomUser is available under the MIT license. See the LICENSE file for more info.

