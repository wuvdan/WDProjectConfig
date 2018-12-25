//
//  WDNetWorkingManager.h
//  AFNetworking
//
//  Created by wudan on 2018/12/25.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^requestSuccess)(__nonnull id obj);
typedef void (^requestFaild)(NSError * _Nonnull obj);
typedef void (^uploadProgressHandler)(CGFloat progress);

typedef NS_ENUM(NSInteger, WDNetWorkingManagerRequestMethod) {
    WDNetWorkingManagerRequestMethod_GET,
    WDNetWorkingManagerRequestMethod_POST,
    WDNetWorkingManagerRequestMethod_DELETE,
    WDNetWorkingManagerRequestMethod_PUT,
    WDNetWorkingManagerRequestMethod_PATCH
};


@interface WDNetWorkingManager : NSObject

+ (instancetype)manager;

/**
 基础网络i请求
 
 @param method 请求形式POST/GET等
 @param url 服务器IP地址
 @param interfacePath 接口名称
 @param parameters 参数
 @param requestSuccess 成功回调
 @param requestFaild 失败回调<！此为网络请求成功但是服务器请求错误>
 @param showIndicator 是否显示loading
 */
- (void)requsetDataWithRequestMethod:(WDNetWorkingManagerRequestMethod)method
                       rootUrlString:(NSString *)url
                       interfacePath:(NSString *)interfacePath
                          parameters:(nullable id)parameters
                      requestSuccess:(requestSuccess)requestSuccess
                        requestFaild:(requestFaild)requestFaild
                       showIndicator:(BOOL)showIndicator;
/**
 单图上传
 
 @param image 图片对象
 @param url 上传服务器IP地址
 @param interfacePath 接口名称
 @param parameters 参数
 @param requestSuccess 成功回调
 @param requestFaild 失败回调<！此为网络请求成功但是服务器请求错误>
 @param showIndicator 是否显示loading
 */
- (void)uploadSingleImage:(UIImage *)image
            rootUrlString:(NSString *)url
            interfacePath:(NSString *)interfacePath
               parameters:(nullable id)parameters
           uploadProgress:(uploadProgressHandler)uploadProgress
           requestSuccess:(requestSuccess)requestSuccess
             requestFaild:(requestFaild)requestFaild
            showIndicator:(BOOL)showIndicator;
/**
 多图上传
 
 @param images 图片数组
 @param url 上传服务器IP地址
 @param interfacePath 接口名称
 @param parameters 参数
 @param requestSuccess 成功回调
 @param requestFaild 失败回调<！此为网络请求成功但是服务器请求错误>
 @param showIndicator 是否显示loading
 */
- (void)uploadMultipleImages:(NSArray<UIImage *> *)images
               rootUrlString:(NSString *)url
               interfacePath:(NSString *)interfacePath
                  parameters:(nullable id)parameters
       uploadProgressHandler:(uploadProgressHandler)uploadProgressHandler
              requestSuccess:(requestSuccess)requestSuccess
                requestFaild:(requestFaild)requestFaild
                showIndicator:(BOOL)showIndicator;

@end

NS_ASSUME_NONNULL_END
