//
//  WDNetWorkingManager.m
//  AFNetworking
//
//  Created by wudan on 2018/12/25.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "WDNetWorkingManager.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface WDNetWorkingManager ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation WDNetWorkingManager

+ (instancetype)manager {
    static dispatch_once_t onceToken;
    static WDNetWorkingManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[WDNetWorkingManager alloc] init];
    });
    return manager;
}

- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer.timeoutInterval = 180;
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", nil];
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _sessionManager;
}

- (void)requsetDataWithRequestMethod:(WDNetWorkingManagerRequestMethod)method
                       rootUrlString:(NSString *)url
                       interfacePath:(NSString *)interfacePath
                          parameters:(id)parameters
                      requestSuccess:(requestSuccess)requestSuccess
                        requestFaild:(requestFaild)requestFaild
                       showIndicator:(BOOL)showIndicator {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", url,interfacePath];
    
    if (showIndicator) {
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
        [SVProgressHUD show];
    }
    
    switch (method) {
        case WDNetWorkingManagerRequestMethod_POST:
            [self postRequestWithUrlPath:urlString parameters:parameters requestSuccess:requestSuccess requestFaild:requestFaild showIndicator:showIndicator];
            break;
        case WDNetWorkingManagerRequestMethod_GET:
            [self getRequestWithUrlPath:urlString parameters:parameters requestSuccess:requestSuccess requestFaild:requestFaild showIndicator:showIndicator];
            break;
        case WDNetWorkingManagerRequestMethod_PUT:
            [self putRequestWithUrlPath:urlString parameters:parameters requestSuccess:requestSuccess requestFaild:requestFaild showIndicator:showIndicator];
            break;
        case WDNetWorkingManagerRequestMethod_PATCH:
            [self patchRequestWithUrlPath:urlString parameters:parameters requestSuccess:requestSuccess requestFaild:requestFaild showIndicator:showIndicator];
            break;
        case WDNetWorkingManagerRequestMethod_DELETE:
            [self deleteRequestWithUrlPath:urlString parameters:parameters requestSuccess:requestSuccess requestFaild:requestFaild showIndicator:showIndicator];
            break;
        default:
            break;
    }
}

- (void)postRequestWithUrlPath:(NSString *)urlPath
                    parameters:(id)parameters
                requestSuccess:(requestSuccess)requestSuccess
                  requestFaild:(requestFaild)requestFaild
                 showIndicator:(BOOL)showIndicator {
    
    [self.sessionManager POST:urlPath parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if (requestSuccess) {
            NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:0 error:NULL];
            if(dict){
                requestSuccess(dict);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (requestFaild) {
            requestFaild(error);
        }
    }];
}

- (void)getRequestWithUrlPath:(NSString *)urlPath
                   parameters:(id)parameters
               requestSuccess:(requestSuccess)requestSuccess
                 requestFaild:(requestFaild)requestFaild
                showIndicator:(BOOL)showIndicator {
    [self.sessionManager GET:urlPath parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if (requestSuccess) {
            NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:0 error:NULL];
            if(dict){
                requestSuccess(dict);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (requestFaild) {
            requestFaild(error);
        }
    }];
}

- (void)putRequestWithUrlPath:(NSString *)urlPath
                  parameters:(id)parameters
               requestSuccess:(requestSuccess)requestSuccess
                 requestFaild:(requestFaild)requestFaild
                showIndicator:(BOOL)showIndicator {
    [self.sessionManager PUT:urlPath parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if (requestSuccess) {
            NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:0 error:NULL];
            if(dict){
                requestSuccess(dict);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (requestFaild) {
            requestFaild(error);
        }
    }];
}

- (void)deleteRequestWithUrlPath:(NSString *)urlPath
                      parameters:(id)parameters
                  requestSuccess:(requestSuccess)requestSuccess
                    requestFaild:(requestFaild)requestFaild
                   showIndicator:(BOOL)showIndicator {
    
    [self.sessionManager DELETE:urlPath parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if (requestSuccess) {
            NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:0 error:NULL];
            if(dict){
                requestSuccess(dict);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (requestFaild) {
            requestFaild(error);
        }
    }];
}

- (void)patchRequestWithUrlPath:(NSString *)urlPath
                     parameters:(id)parameters
                 requestSuccess:(requestSuccess)requestSuccess
                   requestFaild:(requestFaild)requestFaild
                  showIndicator:(BOOL)showIndicator {
    [self.sessionManager PATCH:urlPath parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if (requestSuccess) {
            NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:0 error:NULL];
            if(dict){
                requestSuccess(dict);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (requestFaild) {
            requestFaild(error);
        }
    }];
}

- (void)uploadSingleImage:(UIImage *)image
            rootUrlString:(NSString *)url
            interfacePath:(NSString *)interfacePath
               parameters:(_Nullable id)parameters
           uploadProgress:(uploadProgressHandler)uploadProgress
           requestSuccess:(requestSuccess)requestSuccess
             requestFaild:(requestFaild)requestFaild
            showIndicator:(BOOL)showIndicator {
    
    [self uploadMultipleImages:@[image]
                    rootUrlString:url
                    interfacePath:interfacePath
                       parameters:parameters
            uploadProgressHandler:uploadProgress
                   requestSuccess:requestSuccess
                     requestFaild:requestFaild
                    showIndicator:showIndicator];
}

- (void)uploadMultipleImages:(NSArray<UIImage *> *)images
               rootUrlString:(NSString *)url
               interfacePath:(NSString *)interfacePath
                  parameters:(id)parameters
       uploadProgressHandler:(uploadProgressHandler)uploadProgressHandler
              requestSuccess:(requestSuccess)requestSuccess
                requestFaild:(requestFaild)requestFaild
               showIndicator:(BOOL)showIndicator {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", url,interfacePath];
    
    [self.sessionManager POST:urlString
                   parameters:parameters
    constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (int i = 0; i < images.count; i++) {
            UIImage  *image = images[i];
            NSString *dateString = [self currentDate];
            NSString *fileName = [NSString  stringWithFormat:@"%@.png",dateString];
            NSData *imageData = UIImageJPEGRepresentation(image, 1);
            double scaleNum = (double)300*1024/imageData.length;
            imageData = scaleNum < 1 ? UIImageJPEGRepresentation(image, scaleNum) : UIImageJPEGRepresentation(image, 0.1);
            [formData  appendPartWithFileData:imageData
                                         name:@"file"
                                     fileName:fileName
                                     mimeType:@"image/jpg/png/jpeg/gif"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (showIndicator) {
                [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
                [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
                [SVProgressHUD showProgress:1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount];
            }
            if (uploadProgressHandler) {
                uploadProgressHandler(1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
            }
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if (requestSuccess) {
            NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:0 error:NULL];
            if(dict){
                requestSuccess(dict);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (requestFaild) {
            requestFaild(error);
        }
    }];
}


// 上传图片获取时间作为图片名称
- (NSString *)currentDate {
    NSDate *date = [NSDate date];
    NSDateFormatter *formormat = [[NSDateFormatter alloc]init];
    [formormat setDateFormat:@"HH-mm-ss-sss"];
    return [formormat stringFromDate:date];
}


@end
