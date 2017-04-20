//
//  BlogModel.h
//  GhostWriter
//
//  Created by yanguo sun on 20/04/2017.
//  Copyright © 2017 Lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogModel : NSObject
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
- (NSArray *)array;
@end
