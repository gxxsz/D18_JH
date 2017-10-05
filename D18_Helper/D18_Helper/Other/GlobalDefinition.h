//
//  GlobalDefinition.h
//  MORRIGAN
//
//  Created by mac-jhw on 16/10/7.
//  Copyright © 2016年 mac-jhw. All rights reserved.
//

#ifndef GlobalDefinition_h
#define GlobalDefinition_h


// --------------------------------------------------------------------------------------------------------
#define UI_Window    [[[UIApplication sharedApplication] delegate] window] //获得window
#define kScreenSize           [[UIScreen mainScreen] bounds].size                 //(e.g. 320,480)
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width           //(e.g. 320)
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height          //包含状态bar的高度(e.g. 480)
#define kApplicationSize      [[UIScreen mainScreen] applicationFrame].size       //(e.g. 320,460)
#define kApplicationWidth     [[UIScreen mainScreen] applicationFrame].size.width //(e.g. 320)
#define kApplicationHeight    [[UIScreen mainScreen] applicationFrame].size.height//不包含状态bar的高度(e.g. 460)
#define kNavigationBarHeight  64


// ---------------------------------------------------------------------------------------------------------
#define HTTP_KEY_RESULTCODE     @"retCode"       //http请求resultcode Key
#define HTTP_KEY_RESULTMESSAGE  @"retMsg"        //http请求resultMsg Key

#define HTTP_RESULTCODE_SUCCESS         @"000"      //http请求resultcode 成功
#define HTTP_RESULTCODE_ERROR           @"001"      //http请求resultcode 失败

// ---------------------------------------------------------------------------------------------------------

#define APP_SERVER_URL    @"http://112.74.100.227:8083/"

// 注册
#define ID_REGISTER             1001
#define URL_REGISTER            @"http://112.74.100.227:8083/rest/moli/regist"
// 短信验证码
#define ID_GET_PHONE_MSG_CODE   1002
#define URL_GET_PHONE_MSG_CODE  @"http://112.74.100.227:8083//rest/moli/send-msg"
// 登陆
#define ID_LOGIN                1003
#define URL_LOGIN               @"http://112.74.100.227:8083/rest/moli/login"
// 重置密码
#define ID_RESET_PWD            1004
#define URL_RESET_PWD           @"http://112.74.100.227:8083/rest/moli/forget-psw"

// 编辑个人信息
#define ID_EDIT_USERINFO            1005
#define URL_EDIT_USERINFO        APP_SERVER_URL@"rest/moli/eidt-user-info"

//上传头像
#define ID_UPLOAD_HEADER            1006
#define URL_UPLOAD_HEADER           APP_SERVER_URL@"rest/moli/upload-img"

// 绑定设备
#define ID_BINGDING_DEVICE            1007
#define URL_BINGDING_DEVICE           APP_SERVER_URL@"rest/moli/bind"

// 解除绑定
#define ID_UNBINGDING_DEVICE            1008
#define URL_UNBINGDING_DEVICE           APP_SERVER_URL@"rest/moli/remove-bind"

// 护理记录上传
#define ID_UPLOAD_RECORD            1009
#define URL_UPLOAD_RECORD            APP_SERVER_URL@"rest/moli/upload-record-list"

// 护理记录查询
#define ID_GET_RECORD            1010
#define URL_GET_RECORD            APP_SERVER_URL@"rest/moli/get-record-list"

// 注销账户
#define ID_CANCEL_MOLI            1011
#define URL_CANCEL_MOLI            APP_SERVER_URL@"rest/moli/cancel"

//意见反馈
#define ID_FEEDBACK_MOLI            1012
#define URL_FEEDBACK_MOLI            APP_SERVER_URL@"rest/moli/feedback"

// ---------------------------------------------------------------------------------------------------------
#define kColor_440067  @"#440067"  // 深紫色
#define kColor_6911a5  @"#6911a5"  // 普通紫色
#define kColor_ffffff  @"#ffffff"  // 白色

#define TARGETCHANGENOTIFICATION  @"TARGETCHANGENOTIFICATION"  // 训练目标改变通知



#endif /* GlobalDefinition_h */
