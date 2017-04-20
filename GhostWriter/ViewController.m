//
//  ViewController.m
//  GhostWriter
//
//  Created by yanguo sun on 17/04/2017.
//  Copyright © 2017 Lvmama. All rights reserved.
//
/*
 
 
 id integer PRIMARY KEY AUTOINCREMENT NOT NULL,
 uuid varchar(36) NOT NULL,
 title varchar(150) NOT NULL,
 slug varchar(150) NOT NULL,
 markdown text,
 html text,
 image text,
 featured boolean NOT NULL DEFAULT('0'),
 page boolean NOT NULL DEFAULT('0'),
 status varchar(150) NOT NULL DEFAULT('draft'),
 language varchar(6) NOT NULL DEFAULT('en_US'),
 meta_title varchar(150),
 meta_description varchar(200),
 author_id integer NOT NULL,
 created_at datetime NOT NULL,
 created_by integer NOT NULL,
 updated_at datetime,
 updated_by integer,
 published_at datetime,
 published_by integer
 */

#import "ViewController.h"

@interface Model()

@property (nonatomic, strong) NSNumber *idNumber;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *markdown;
@property (nonatomic, strong) NSString *html;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSNumber *featured;
@property (nonatomic, strong) NSNumber *page;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *meta_title;
@property (nonatomic, strong) NSString *meta_description;
@property (nonatomic, strong) NSNumber *author_id;
@property (nonatomic, strong) NSDate *created_at;
@property (nonatomic, strong) NSNumber *created_by;
@property (nonatomic, strong) NSDate *updated_at;
@property (nonatomic, strong) NSNumber *updated_by;
@property (nonatomic, strong) NSDate *published_at;
@property (nonatomic, strong) NSNumber *published_by;

@end

@implementation Model

- (NSString *)description {
    return [NSString stringWithFormat:@"\n{%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n}",self.idNumber,self.uuid,self.title,self.slug, self.markdown, self.html, self.image, self.featured, self.page, self.status,self.language, self.meta_title, self.meta_description, self.author_id, self.created_at, self.created_by,self.updated_at, self.updated_by,self.published_at, self.published_by];
}

- (NSArray *)array {
    return @[self.idNumber,self.uuid,self.title,self.slug, self.markdown, self.html, self.image, self.featured, self.page, self.status,self.language, self.meta_title, self.meta_description, self.author_id, self.created_at, self.created_by,self.updated_at, self.updated_by,self.published_at, self.published_by];
}
@end


@import FMDB;
@import AFNetworking;

@implementation ViewController {
    FMDatabaseQueue *databaseQueue;
    AFHTTPSessionManager *manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//#!/bin/sh
//#1.slug
//    curl -H 'Host: www.joyu.club' -H 'Accept-Language: en-us' -H 'Cookie: Hm_lpvt_d404bc0de3cceaf29a659e9b7ee4ed48=1492657146; Hm_lvt_d404bc0de3cceaf29a659e9b7ee4ed48=1491877616,1492148388,1492434220,1492657139' -H 'Accept: */*' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.1 Safari/603.1.30' -H 'Authorization: Bearer shouquanbianliang' -H 'Referer: https://www.joyu.club/ghost/editor/' -H 'X-Requested-With: XMLHttpRequest' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' --compressed 'https://www.joyu.club/ghost/api/v0.1/slugs/post/biaotibianliang/'
//#2.
//   curl -H 'Host: www.joyu.club' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Authorization: Bearer DRlCapXPCif6zgarJR8frEAUmyVbyzHQ7F2d4t8bvnYEKbOqGAbsqHM3bVMVCWaeQ7dels0PeHAC0aBCHJGVnCu04NiS5OJ8peMY12oxOTaz0PGzsCBh1XhCh5HB28YqMv7pM8JpkpcqPD8DoKJT9nwYDZn1XYbJJGyoYPmzq5aF97NQ0ZwQEzxcs36SiDXZ0k8GXgSLpsmmrDiaqxvhM5p8qDUZ7ayAY7Mm2QCUAyCRplRukDWHKvLyj1dfyXW' -H 'X-Requested-With: XMLHttpRequest' -H 'Accept-Language: en-us' -H 'Content-Type: application/json; charset=UTF-8' -H 'Origin: https://www.joyu.club' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.1 Safari/603.1.30' -H 'Referer: https://www.joyu.club/ghost/editor/' -H 'Cookie: Hm_lpvt_d404bc0de3cceaf29a659e9b7ee4ed48=1492662674; Hm_lvt_d404bc0de3cceaf29a659e9b7ee4ed48=1491877616,1492148388,1492434220,1492657139' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' --data-binary '{"posts":[{"title":"wosh","slug":"wosh","markdown":"","image":null,"featured":false,"page":false,"status":"draft","language":"zh_CN","meta_title":null,"meta_description":null,"author":"1","published_by":null,"tags":[]}]}' --compressed 'https://www.joyu.club/ghost/api/v0.1/posts/?include=tags'
//    
//    
//    
//#3.
//    curl -H 'Host: www.joyu.club' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Authorization: Bearer shouquanbianliang' -H 'X-Requested-With: XMLHttpRequest' -H 'Accept-Language: en-us' -H 'Content-Type: application/json; charset=UTF-8' -H 'Origin: https://www.joyu.club' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.1 Safari/603.1.30' -H 'Referer: https://www.joyu.club/ghost/editor/idbianliang/' -H 'Cookie: Hm_lpvt_d404bc0de3cceaf29a659e9b7ee4ed48=1492657146; Hm_lvt_d404bc0de3cceaf29a659e9b7ee4ed48=1491877616,1492148388,1492434220,1492657139' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' --data-binary 'fabujsonbianliang' -X PUT --compressed 'https://www.joyu.club/ghost/api/v0.1/posts/idbianliang/?include=tags'
    
    
//    curl  -H 'Authorization: Bearer RzdoQCiLEr1mNvxxaPHOPKIC4pYRfTVROkUYLtH2mu2Yry948cwCrP85dXBoZo901SBI4jG2dlRdsdBcYpEquMhWE50z1xYQG0frQxayY7RcCCvtaM7u21Nhanu0WGIluBXskSYHhugjFpXzB6VfttGAF97AuzAlUBvAWpQBT9rgRCzExYhbWn8XcMibgwhaPEiLC3gacYa3Gt8FcTxax0M4dV9WT0gv98cZ76SNrOSUciLzreyfVXKt6dNzEUA' 'https://www.joyu.club/ghost/api/v0.1/posts/?page=1&limit=15&status=all&staticPages=all&include=tags'
    
    
//  Authorization	Bearer DRlCapXPCif6zgarJR8frEAUmyVbyzHQ7F2d4t8bvnYEKbOqGAbsqHM3bVMVCWaeQ7dels0PeHAC0aBCHJGVnCu04NiS5OJ8peMY12oxOTaz0PGzsCBh1XhCh5HB28YqMv7pM8JpkpcqPD8DoKJT9nwYDZn1XYbJJGyoYPmzq5aF97NQ0ZwQEzxcs36SiDXZ0k8GXgSLpsmmrDiaqxvhM5p8qDUZ7ayAY7Mm2QCUAyCRplRukDWHKvLyj1dfyXW
    manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [[AFJSONRequestSerializer alloc] init];
    [manager.requestSerializer setValue:@"Bearer DRlCapXPCif6zgarJR8frEAUmyVbyzHQ7F2d4t8bvnYEKbOqGAbsqHM3bVMVCWaeQ7dels0PeHAC0aBCHJGVnCu04NiS5OJ8peMY12oxOTaz0PGzsCBh1XhCh5HB28YqMv7pM8JpkpcqPD8DoKJT9nwYDZn1XYbJJGyoYPmzq5aF97NQ0ZwQEzxcs36SiDXZ0k8GXgSLpsmmrDiaqxvhM5p8qDUZ7ayAY7Mm2QCUAyCRplRukDWHKvLyj1dfyXW" forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"https://www.joyu.club/ghost/editor/" forHTTPHeaderField:@"Referer"];
    [manager.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
    [manager.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Pragma"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"UTF-8" forHTTPHeaderField:@"charset"];
    [manager.requestSerializer setValue:@"https://www.joyu.club" forHTTPHeaderField:@"Origin"];
    [manager.requestSerializer setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.1 Safari/603.1.30" forHTTPHeaderField:@"User-Agent"];
    manager.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    

    NSString *biaotibianliang = @"biaoti2233";
    NSString *createSlugUrl = [NSString stringWithFormat:@"https://www.joyu.club/ghost/api/v0.1/slugs/post/%@/",biaotibianliang];
    NSString *caogaoUrl = @"https://www.joyu.club/ghost/api/v0.1/posts/?include=tags";

    [manager GET:createSlugUrl parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [manager.requestSerializer setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
        [manager.requestSerializer setValue:@"en-us" forHTTPHeaderField:@"Accept-Language"];
        
        NSString *caogaojson = @"{\"posts\":[{\"title\":\"biaotibianliang\",\"slug\":\"biaotibianliang\",\"markdown\":\"\",\"image\":null,\"featured\":false,\"page\":false,\"status\":\"draft\",\"language\":\"zh_CN\",\"meta_title\":null,\"meta_description\":null,\"author\":\"1\",\"published_by\":null,\"tags\":[]}]}";
       NSDictionary *createjsonbianliang = [NSJSONSerialization JSONObjectWithData:[caogaojson dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
        NSMutableDictionary *ic = [[createjsonbianliang[@"posts"] firstObject] mutableCopy];
        

        [ic setValue:biaotibianliang forKey:@"title"];
        [ic setValue:biaotibianliang forKey:@"slug"];
        NSString *abc = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:@{@"posts":@[ic]} options:0 error:nil] encoding:NSUTF8StringEncoding];
        [manager POST:caogaoUrl parameters:@{@"posts":@[ic]} progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [ic setObject:@"published" forKey:@"status"];
            NSDictionary *fabujsonbianliang = @{@"posts":@[ic]};
            NSMutableDictionary *ic2 = [[responseObject[@"posts"] firstObject] mutableCopy];

            [manager.requestSerializer setValue:[@"https://www.joyu.club/ghost/editor/" stringByAppendingString:biaotibianliang] forHTTPHeaderField:@"Referer"];
            NSString *idbiangliang = [[ic2 objectForKey:@"id"] description];
            NSString *fabuUrl = [NSString stringWithFormat:@"https://www.joyu.club/ghost/api/v0.1/posts/%@/?include=tags",idbiangliang];

            [manager PUT:fabuUrl parameters:fabujsonbianliang success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@",responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"%@",error);
            }];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
//    NSString *aa = @"{\"id\":1,\"uuid\":\"ec630e45-3342-4d7f-a24c-e448263c975b\",\"title\":\"Welcome to Ghost\",\"slug\":\"welcome-to-ghost\",\"markdown\":\"Yourelive!Nice.\",\"html\":\"<p>Yourelive!Nice.</p>\",\"image\":\"/content/images/2014/12/my-image.png\",\"featured\":false,\"page\":false,\"status\":\"published\",\"language\":\"en_US\",\"meta_title\":null,\"meta_description\":null,\"author_id\":1,\"created_at\":\"2014-04-15T12: 36: 28.353Z\",\"created_by\":1,\"updated_at\":\"2014-04-15T12: 36: 28.353Z\",\"updated_by\":1,\"published_at\":\"2014-04-15T12: 36: 28.363Z\",\"published_by\":1}";
//    NSData *data = [aa dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *cid = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//    NSDictionary *to = @{@"posts":@[cid]};
    
    return;
    
    NSString *writableDBPath = @"/Users/sunyanguo/Documents/gitwork/ghost/ghost074/content/data/ghost.db";
    databaseQueue = [FMDatabaseQueue databaseQueueWithPath:writableDBPath];
    NSMutableArray *mutArray = [NSMutableArray array];
    [databaseQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM posts"];
        while ([resultSet next]) {
            Model *aModel = [[Model alloc] init];
            aModel.idNumber = @([resultSet intForColumn:@"id"]);
            aModel.uuid = [resultSet stringForColumn:@"uuid"]?:@"NULL";
            CFUUIDRef puuid = CFUUIDCreate(nil);
            CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
            aModel.uuid = [(NSString *)CFBridgingRelease(CFStringCreateCopy(NULL, uuidString)) lowercaseString];
            aModel.title = [resultSet stringForColumn:@"title"]?:@"NULL";
            aModel.slug = [resultSet stringForColumn:@"slug"]?:@"NULL";
            aModel.slug = [aModel.slug stringByAppendingString:@"1"];
            aModel.markdown = [resultSet stringForColumn:@"markdown"]?:@"NULL";
            aModel.html = [resultSet stringForColumn:@"html"]?:@"NULL";
            aModel.image = [resultSet stringForColumn:@"image"]?:@"NULL";
            aModel.featured = @([resultSet intForColumn:@"featured"])?:@(0);
            aModel.page = @([resultSet intForColumn:@"page"])?:@(0);
            aModel.status = [resultSet stringForColumn:@"status"]?:@"NULL";
            aModel.language = [resultSet stringForColumn:@"language"]?:@"NULL";
            aModel.meta_title = [resultSet stringForColumn:@"meta_title"]?:@"NULL";
            aModel.meta_description = [resultSet stringForColumn:@"meta_description"]?:@"NULL";
            aModel.author_id = @([resultSet intForColumn:@"author_id"])?:@(0);
            aModel.created_at = [resultSet dateForColumn:@"created_at"]?:[NSDate date];
            aModel.created_by = @([resultSet intForColumn:@"created_by"])?:@(0);
            aModel.updated_at = [resultSet dateForColumn:@"updated_at"]?:[NSDate date];
            aModel.updated_by = @([resultSet intForColumn:@"updated_by"])?:@(0);
            aModel.published_at = [resultSet dateForColumn:@"published_at"]?:[NSDate date];
            aModel.published_by = @([resultSet intForColumn:@"published_by"])?:@(0);
            NSLog(@"%@",aModel);
            [mutArray addObject:aModel];
        }
    }];
    
    [databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        for(int i=0; i<mutArray.count; i++) {
            Model *bModel = mutArray[i];
            bModel.idNumber = @([bModel.idNumber integerValue] + mutArray.count);
            BOOL ret = [db executeUpdate:@"INSERT INTO posts(id, uuid, title, slug, markdown, html, image, featured, page, status, language, meta_title, meta_description, author_id, created_at, created_by, updated_at, updated_by, published_at, published_by) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" withArgumentsInArray:[bModel array]];
            assert(ret);
        }
    }];
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];


}


@end
