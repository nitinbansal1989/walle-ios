//
//  JPSHA256HMAC.h
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/14/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPSHA256HMAC : NSObject

- (NSString *)hashingSHA256HMAC:(NSString *)secret andText:(NSString *)dataMatter;
- (NSString *)base64forData:(NSData *)theData;

@end
