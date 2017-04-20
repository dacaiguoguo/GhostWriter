//
//  ViewController.m
//  GhostWriter
//
//  Created by yanguo sun on 17/04/2017.
//  Copyright © 2017 Lvmama. All rights reserved.
//

#import "ViewController.h"
#import "BlogModel.h"


@import AFNetworking;

@implementation ViewController {
    AFHTTPSessionManager *requestManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *AuthorizationKey = @"Bearer DRlCapXPCif6zgarJR8frEAUmyVbyzHQ7F2d4t8bvnYEKbOqGAbsqHM3bVMVCWaeQ7dels0PeHAC0aBCHJGVnCu04NiS5OJ8peMY12oxOTaz0PGzsCBh1XhCh5HB28YqMv7pM8JpkpcqPD8DoKJT9nwYDZn1XYbJJGyoYPmzq5aF97NQ0ZwQEzxcs36SiDXZ0k8GXgSLpsmmrDiaqxvhM5p8qDUZ7ayAY7Mm2QCUAyCRplRukDWHKvLyj1dfyXW";
    
    requestManager = [AFHTTPSessionManager manager];
    requestManager.requestSerializer = [[AFJSONRequestSerializer alloc] init];
    [requestManager.requestSerializer setValue:AuthorizationKey forHTTPHeaderField:@"Authorization"];
    [requestManager.requestSerializer setValue:@"https://www.joyu.club/ghost/editor/" forHTTPHeaderField:@"Referer"];
    [requestManager.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
    [requestManager.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Pragma"];
    [requestManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestManager.requestSerializer setValue:@"UTF-8" forHTTPHeaderField:@"charset"];
    [requestManager.requestSerializer setValue:@"https://www.joyu.club" forHTTPHeaderField:@"Origin"];
    [requestManager.requestSerializer setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.1 Safari/603.1.30" forHTTPHeaderField:@"User-Agent"];
    requestManager.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    

    NSString *titleString = @"biaoti2233";
    NSString *createSlugUrl = [NSString stringWithFormat:@"https://www.joyu.club/ghost/api/v0.1/slugs/post/%@/",titleString];
    NSString *createDraftUrl = @"https://www.joyu.club/ghost/api/v0.1/posts/?include=tags";

    [requestManager GET:createSlugUrl parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [requestManager.requestSerializer setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
        [requestManager.requestSerializer setValue:@"en-us" forHTTPHeaderField:@"Accept-Language"];
        
        NSString *draftJson = @"{\"posts\":[{\"title\":\"biaotibianliang\",\"slug\":\"biaotibianliang\",\"markdown\":\"\",\"image\":null,\"featured\":false,\"page\":false,\"status\":\"draft\",\"language\":\"zh_CN\",\"meta_title\":null,\"meta_description\":null,\"author\":\"1\",\"published_by\":null,\"tags\":[]}]}";
       NSDictionary *createjsonbianliang = [NSJSONSerialization JSONObjectWithData:[draftJson dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
        NSMutableDictionary *blogOne = [[createjsonbianliang[@"posts"] firstObject] mutableCopy];
        

        [blogOne setValue:titleString forKey:@"title"];
        [blogOne setValue:titleString forKey:@"slug"];

        [requestManager POST:createDraftUrl parameters:@{@"posts":@[blogOne]} progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            blogOne[@"status"] = @"published";
            NSDictionary *publishDictionary = @{@"posts":@[blogOne]};
            NSMutableDictionary *responseBlogOne = [[responseObject[@"posts"] firstObject] mutableCopy];

            [requestManager.requestSerializer setValue:[@"https://www.joyu.club/ghost/editor/" stringByAppendingString:titleString] forHTTPHeaderField:@"Referer"];
            NSString *idbiangliang = [responseBlogOne[@"id"] description];
            NSString *fabuUrl = [NSString stringWithFormat:@"https://www.joyu.club/ghost/api/v0.1/posts/%@/?include=tags",idbiangliang];

            [requestManager PUT:fabuUrl parameters:publishDictionary success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@",responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"%@",error);
            }];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

    
    
}


- (void)setRepresentedObject:(id)representedObject {
    super.representedObject = representedObject;


}


@end
