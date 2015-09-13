//
//  MTURLRequestBuilderInterface.h
//
//  Created by MAXIM TSVETKOV on 28.08.15.
//

#import "MTURLRequestBuilderConstants.h"

@protocol MTURLRequestBuilderInterface <NSObject>

- (NSURLRequest *)makeRequestWithScheme:(NSString *)scheme
                                   host:(NSString *)host
                                   path:(NSString *)path
                                 method:(NSString *)method
                                 params:(id)params;
- (NSURLRequest *)makeRequestWithURLString:(NSString *)urlString
                                    method:(NSString *)method
                                    params:(id)params;
- (NSURLRequest *)makeRequestWithURL:(NSURL *)url
                              method:(NSString *)method
                              params:(id)params;

@end
