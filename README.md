MTRequestBuilder
====================

This class builds URL request for networking.

```objective-c
- (NSURLRequest *)makeRequestWithScheme:(NSString *)scheme host:(NSString *)host path:(NSString *)path  method:(NSString *)method params:(id)params
```

returns URL request with given scheme, host, path, method and params.

```objective-c
- (NSURLRequest *)makeRequestWithURLString:(NSString *)urlString method:(NSString *)method params:(id)params
```

returns URL request with given URL string, method and params.

```objective-c
- (NSURLRequest *)makeRequestWithURL:(NSURL *)url method:(NSString *)method params:(id)params
```

returns URL request with given URL, method and params.

Usage
====================
Just copy files from Classes into your project and include `MTURLRequestBuilder.h`. 

DemoApp
====================
See DemoAppTests.m
