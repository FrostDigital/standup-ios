//
//  Standup_iOSTests.m
//  Standup-iOSTests
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <ObjectiveSugar.h>
#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "FDTeam.h"
#import "FDUser.h"


@interface Standup_iOSTests : XCTestCase

@end

@implementation Standup_iOSTests
@end

SpecBegin(FDTeamTests)
    __block FDTeam *team;

    beforeAll(^{
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"mockTeam" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        team = [[FDTeam alloc] initWithDictionary:json];
    });

    describe(@"Team From Dictionary", ^{
        example(@"Team Name as expected", ^{
            expect(team.teamName).to.equal(@"Frost Stockholm");
        });

        example(@"Users count as expected", ^{
            expect(team.users.count).to.equal(6);
        });
    });

SpecEnd


SpecBegin(FDUserTests)
    __block FDUser *joelActive, *linaInactive;

    beforeAll(^{
        NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"mockTeam" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *joelJSON = ((NSArray *)((NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil])[@"users"]).firstObject;
        joelActive = [[FDUser alloc] initWithDictionary:joelJSON];
        NSDictionary *linaJSON = ((NSArray *)((NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil])[@"users"]).lastObject;
        linaInactive = [[FDUser alloc] initWithDictionary:linaJSON];
    });

        describe(@"Joel User properties are inited properly", ^{
            example(@"User name as expected", ^{
                expect(joelActive.name).to.equal(@"Joel");
            });
            example(@"User ID as expected", ^{
                expect(joelActive.userId).to.equal(@"45cd0a3e-214a-43d8-9d84-eaacf78e9bcd");
            });
            example(@"User avatar as expected", ^{
                expect(joelActive.avatar).to.equal(@"http://placekitten.com/200/200");
            });
            example(@"User state as expected", ^{
                expect(joelActive.isActive).to.equal(YES);
            });
        });

        describe(@"Lina User properties are inited properly", ^{
            example(@"User name as expected", ^{
                expect(linaInactive.name).to.equal(@"Lina");
            });
            example(@"User ID as expected", ^{
                expect(linaInactive.userId).to.equal(@"a925673d-e34b-4e1d-bb32-d1d263c91d42");
            });
            example(@"User avatar as expected", ^{
                expect(linaInactive.avatar).to.equal(@"http://placekitten.com/200/200");
            });
            example(@"User state as expected", ^{
                expect(linaInactive.isActive).to.equal(NO);
            });
        });

SpecEnd
