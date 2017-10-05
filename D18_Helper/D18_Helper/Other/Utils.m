//
//  Utils.m
//  MORRIGAN
//
//  Created by mac-jhw on 16/10/7.
//  Copyright © 2016年 mac-jhw. All rights reserved.
//

#import "Utils.h"

@implementation Utils



//判断手机号码格式是否正确
+ (BOOL)checkMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}


//判断验证码是否有效
+ (BOOL)checkAuthCode:(NSString *)authCode
{
    //4-9位数字
    NSString *regex = @"^[0-9]{4,9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:authCode]) {
        return YES ;
    } else {
        return NO;
    }
}


//判断密码是否有效
+ (BOOL)checkPassWord:(NSString *)password
{
//    //6-20位数字和字母组成
//    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
//    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//    if ([pred evaluateWithObject:self]) {
//        return YES ;
//    } else {
//        return NO;
//    }
    
    //6-20位数字或字母组成
    NSString *regex = @"^[0-9A-Za-z]{6,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:password]) {
        return YES ;
    } else {
        return NO;
    }
}


// 十六进制转UIColor（如@“＃ff0000”）
+ (UIColor *) stringTOColor:(NSString *)str
{
    if (!str || [str isEqualToString:@""]) {
        return nil;
    }
    unsigned red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 1;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    return color;
}

/**
 *
 * nsdata转nsstring
 *
 **/
+ (NSString*)hexStringForData:(NSData *)data
{
    if(data == nil) {
        return nil;
    }
    NSMutableString *hexString = [NSMutableString string];
    const unsigned char *p = [data bytes];
    for (int i = 0; i < [data length]; i++) {
        [hexString appendFormat:@"%02x", *p++];
    }
    
    return hexString;
}


/**
 *
 *  nsstring转nsdata
 *
 **/
+ (NSData*)dataForHexString:(NSString*)hexString
{
    if (hexString == nil) {
        return nil;
    }
    
    const char* ch = [[hexString lowercaseString] cStringUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* data = [NSMutableData data];
    while (*ch) {
        if (*ch == ' ') {
            continue;
        }
        char byte = 0;
        if ('0' <= *ch && *ch <= '9') {
            byte = *ch - '0';
        }
        else if ('a' <= *ch && *ch <= 'f') {
            byte = *ch - 'a' + 10;
        }
        else if ('A' <= *ch && *ch <= 'F') {
            byte = *ch - 'A' + 10;
        }
        ch++;
        byte = byte << 4;
        if (*ch) {
            if ('0' <= *ch && *ch <= '9') {
                byte += *ch - '0';
            } else if ('a' <= *ch && *ch <= 'f') {
                byte += *ch - 'a' + 10;
            }
            else if('A' <= *ch && *ch <= 'F')
            {
                byte += *ch - 'A' + 10;
            }
            ch++;
        }
        [data appendBytes:&byte length:1];
    }
    return data;
    
    //    // 另一种方式实现
    //    + (NSData *)hexToBytes:(NSString *)string {
    //        NSMutableData* data = [NSMutableData data];
    //        int idx;
    //        for (idx = 0; idx+2 <= string.length; idx+=2) {
    //            NSRange range = NSMakeRange(idx, 2);
    //            NSString* hexStr = [string substringWithRange:range];
    //            NSScanner* scanner = [NSScanner scannerWithString:hexStr];
    //            unsigned int intValue;
    //            [scanner scanHexInt:&intValue];
    //            [data appendBytes:&intValue length:1];
    //        }
    //        return data;
    //    }
    
}


/**
 *
 *  十六进制字符串转十进制（如：@"AA" -> 170）
 *
 **/
+ (NSInteger)hexToInt:(NSString *)hexString
{
    NSString *resultStr = [NSString stringWithFormat:@"%lu",strtoul([hexString UTF8String],0,16)];
    NSInteger result = [resultStr integerValue];
    
    //NSLog(@"hexString: %@  ----->   int: %ld", hexString, result);
    
    return result;
}


/**
 *
 *  十进制转十六进制字符串（如：170 -> @"AA"）
 *
 **/
+ (NSString *)intToHex:(uint16_t)number
{
    NSString *nLetterValue;
    NSString *str =@"";
    uint16_t ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=number%16;
        number=number/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (number == 0) {
            break;
        }
        
    }
    return str;
}




@end
