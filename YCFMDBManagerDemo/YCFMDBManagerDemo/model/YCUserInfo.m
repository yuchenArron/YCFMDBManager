//
//  YCUserInfo.m
//
//  Created by YuChen Zhang on 2017/7/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "YCUserInfo.h"


NSString *const kYCUserInfoName = @"name";
NSString *const kYCUserInfoSex = @"sex";
NSString *const kYCUserInfoAge = @"age";


@interface YCUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation YCUserInfo

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.name = [self objectOrNilForKey:kYCUserInfoName fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kYCUserInfoSex fromDictionary:dict];
            self.age = [[self objectOrNilForKey:kYCUserInfoAge fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (instancetype)init{
    self = [super init ];
    if (self) {
        self.name = @"yuchen";
        self.age = 12;
        self.sex = @"1";
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kYCUserInfoName];
    [mutableDict setValue:self.sex forKey:kYCUserInfoSex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.age] forKey:kYCUserInfoAge];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.name = [aDecoder decodeObjectForKey:kYCUserInfoName];
    self.sex = [aDecoder decodeObjectForKey:kYCUserInfoSex];
    self.age = [aDecoder decodeDoubleForKey:kYCUserInfoAge];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kYCUserInfoName];
    [aCoder encodeObject:_sex forKey:kYCUserInfoSex];
    [aCoder encodeDouble:_age forKey:kYCUserInfoAge];
}

- (id)copyWithZone:(NSZone *)zone
{
    YCUserInfo *copy = [[YCUserInfo alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.age = self.age;
    }
    
    return copy;
}


@end
