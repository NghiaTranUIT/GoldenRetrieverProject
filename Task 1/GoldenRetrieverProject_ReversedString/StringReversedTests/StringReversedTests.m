//
//  StringReversedTests.m
//  StringReversedTests
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TextProcessor.h"
#import "StringReversedMiddleware.h"

@interface StringReversedTests : XCTestCase

@end

@implementation StringReversedTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNormalText {

    // Given
    NSString *input = @"abcdefgh";
    NSString *expected = @"hgfedcba";

    // Process
    NSString *result = [self processText: input];

    // Assert
    NSAssert([result isEqualToString:expected], @"Bug");
}


- (void)testTextWithMixingEmojiString {

    // Given
    NSString *input = @"abcdefgh🔥";
    NSString *expected = @"🔥hgfedcba";

    // Process
    NSString *result = [self processText: input];

    // Assert
    NSAssert([result isEqualToString:expected], @"Bug");
}

- (void)testEmojiText {

    // Given
    NSString *input = @"🔥🤣🏙❤️😀🤗🇯🇵";
    NSString *expected = @"🇯🇵🤗😀❤️🏙🤣🔥";

    // Process
    NSString *result = [self processText: input];

    // Assert
    NSAssert([result isEqualToString:expected], @"Bug");
}

- (void)testWithLongInput {

    // Given
    NSString *input = @"You know you should be doing something — whether that’s working on your project, being present with your loved ones, eating healthy, or a number of other things — and you knowingly act in contradictory ways.";
    NSString *expected = @".syaw yrotcidartnoc ni tca ylgniwonk uoy dna — sgniht rehto fo rebmun a ro ,yhtlaeh gnitae ,seno devol ruoy htiw tneserp gnieb ,tcejorp ruoy no gnikrow s’taht rehtehw — gnihtemos gniod eb dluohs uoy wonk uoY";

    // Process
    NSString *result = [self processText: input];

    // Assert
    NSAssert([result isEqualToString:expected], @"Bug");
}

- (void)testLongInputWithEmoji {

    // Given
    NSString *input = @"🔥🤣🏙❤️😀🤗🇯🇵Like me, you may justify your behaviors and convince yourself you’re on the path toward your dreams. But an honest look in the mirror would reveal that you’re deceiving yourself. After all, Gandhi also said, “To believe in something, and not to live it, is dishonest.”";
    NSString *expected = @"”.tsenohsid si ,ti evil ot ton dna ,gnihtemos ni eveileb oT“ ,dias osla ihdnaG ,lla retfA .flesruoy gnivieced er’uoy taht laever dluow rorrim eht ni kool tsenoh na tuB .smaerd ruoy drawot htap eht no er’uoy flesruoy ecnivnoc dna sroivaheb ruoy yfitsuj yam uoy ,em ekiL🇯🇵🤗😀❤️🏙🤣🔥";

    // Process
    NSString *result = [self processText: input];

    // Assert
    NSAssert([result isEqualToString:expected], @"Bug");
}

-(NSString *) processText:(NSString *) input {

    // Create Processor with reverseMiddleware
    // In future, we can extend our middlewares smoothly

    StringReversedMiddleware *reverseMiddleware = [[StringReversedMiddleware alloc] init];
    NSArray<Middleware> *middlewares = (NSArray<Middleware> *) @[reverseMiddleware];
    TextProcessor *processor = [[TextProcessor alloc] initWithMiddleware:middlewares];

    // Process
    return [processor process:input];
}
@end
