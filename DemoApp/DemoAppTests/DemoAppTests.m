//
//  DemoAppTests.m
//  DemoAppTests
//
//  Created by MAXIM TSVETKOV on 13.09.15.
//  Copyright (c) 2015 MAXIM TSVETKOV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MTURLRequestBuilder.h"

@interface DemoAppTests : XCTestCase
{
@private
    MTURLRequestBuilder *urlRequestBuilder;
}
@end

@implementation DemoAppTests

- (void)setUp {
    [super setUp];
    
    urlRequestBuilder = [[MTURLRequestBuilder alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatUrlRequestWithSchemeHostPathHasValidUrlAndMethod {
    
    // arrange
    NSString *scheme = MTURLRequestBuilderURLSchemeHTTP;
    NSString *host = @"site.ru";
    NSString *path = @"/api/test";
    NSString *method = MTURLRequestBuilderHTTPMethodGet;
    
    // act
    NSURLRequest *urlRequest = [urlRequestBuilder makeRequestWithScheme:scheme
                                                                   host:host
                                                                   path:path
                                                                 method:method
                                                                 params:nil];
    // assert
    XCTAssertNotNil(urlRequest);
    XCTAssertEqualObjects(urlRequest.URL.scheme, scheme);
    XCTAssertEqualObjects(urlRequest.URL.host, host);
    XCTAssertEqualObjects(urlRequest.URL.path, path);
    XCTAssertEqualObjects(urlRequest.HTTPMethod, method);
}

- (void)testThatUrlRequestWithUrlStringHasValidUrlAndMethod {
    
    // arrange
    NSString *urlString = @"http://site.ru/api/test";
    NSString *method = MTURLRequestBuilderHTTPMethodGet;
    
    // act
    NSURLRequest *urlRequest = [urlRequestBuilder makeRequestWithURLString:urlString
                                                                    method:method
                                                                    params:nil];
    // assert
    XCTAssertNotNil(urlRequest);
    XCTAssertEqualObjects(urlRequest.URL.absoluteString, urlString);
    XCTAssertEqualObjects(urlRequest.HTTPMethod, method);
}

- (void)testThatUrlRequestWithUrlHasValidUrlAndMethod {
    
    // arrange
    NSURL *url = [NSURL URLWithString:@"http://site.ru/api/test"];
    NSString *method = MTURLRequestBuilderHTTPMethodGet;
    
    // act
    NSURLRequest *urlRequest = [urlRequestBuilder makeRequestWithURL:url
                                                              method:method
                                                              params:nil];
    // assert
    XCTAssertNotNil(urlRequest);
    XCTAssertEqualObjects(urlRequest.URL, url);
    XCTAssertEqualObjects(urlRequest.HTTPMethod, method);
}

- (void)testThatUrlRequestHasValidHTTPHeaders {
    
    // arrange
    NSString *scheme = MTURLRequestBuilderURLSchemeHTTP;
    NSString *host = @"site.ru";
    NSString *path = @"/api/test";
    NSString *method = MTURLRequestBuilderHTTPMethodGet;
    
    // act
    NSURLRequest *urlRequest = [urlRequestBuilder makeRequestWithScheme:scheme
                                                                host:host
                                                                path:path
                                                              method:method
                                                              params:nil];
    
    // assert
    XCTAssertNotNil(urlRequest);
    XCTAssertEqualObjects([urlRequest.allHTTPHeaderFields valueForKey:@"Content-Type"], @"application/json");
    XCTAssertEqualObjects([urlRequest.allHTTPHeaderFields valueForKey:@"Accept"], @"application/json");
}

- (void)testThatUrlRequestHasValidHTTPBody {
    
    // arrange
    NSString *scheme = MTURLRequestBuilderURLSchemeHTTP;
    NSString *host = @"site.ru";
    NSString *path = @"/api/test";
    NSString *method = MTURLRequestBuilderHTTPMethodGet;
    NSDictionary *postParams = @{
                                 @"testKey" : @"testValue"
                                 };
    
    // act
    NSURLRequest *urlRequest = [urlRequestBuilder makeRequestWithScheme:scheme
                                                                host:host
                                                                path:path
                                                              method:method
                                                              params:postParams];
    // assert
    XCTAssertNotNil(urlRequest);
    XCTAssertNotNil(urlRequest.HTTPBody);
    NSError* error = nil;
    NSDictionary *httpBodyDict = [NSJSONSerialization JSONObjectWithData:urlRequest.HTTPBody
                                                                 options:0
                                                                   error:&error];
    XCTAssertNotNil(httpBodyDict);
    XCTAssertNotNil([httpBodyDict valueForKey:@"testKey"]);
    XCTAssertEqualObjects([postParams valueForKey:@"testKey"], [httpBodyDict valueForKey:@"testKey"]);
}

@end
