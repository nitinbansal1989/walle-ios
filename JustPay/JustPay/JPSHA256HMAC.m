//
//  JPSHA256HMAC.m
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/14/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

#import "JPSHA256HMAC.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation JPSHA256HMAC

- (NSString *)hashingSHA256HMAC:(NSString *)secret andText:(NSString *)dataMatter
{
//    NSString* key = @"secret";
//    NSString* data = @"Message";
    
    NSString* key = secret;
    NSString* data = dataMatter;
    
    const char *cKey = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *hash = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    NSLog(@"HASH DATA : %@", hash);
    NSString* base64String = [self base64forData:hash];
    NSLog(@"BASE 64 String : %@",base64String);
    
    return base64String;
}

- (NSString *)base64forData:(NSData *)theData
{
    const uint8_t* input = (const uint8_t *)[theData bytes];
    NSInteger length = [theData length];
    
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    
    NSMutableData * data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t * output = (uint8_t *)data.mutableBytes;
    
    NSInteger i;
    for (i = 0; i < length; i += 3)
    {
        NSInteger value = 0;
        NSInteger j;
        for (j = i; j < (i + 3); j++)
        {
            value <<= 8;
            
            if (j < length) {  value |= (0xFF & input[j]);  }
        }
        
        NSInteger theIndex = (i / 3) * 4;  output[theIndex + 0] = table[(value >> 18) & 0x3F];
        output[theIndex + 1] = table[(value >> 12) & 0x3F];
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6) & 0x3F] : '=';
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0) & 0x3F] : '=';
    }
    
    NSString *outputString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    return outputString;
}

@end
