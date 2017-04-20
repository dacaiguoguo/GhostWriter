//
//  BlogModel.m
//  GhostWriter
//
//  Created by yanguo sun on 20/04/2017.
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
#import "BlogModel.h"

@implementation BlogModel

- (NSString *)description {
    return [NSString stringWithFormat:@"\n{%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n}",self.idNumber,self.uuid,self.title,self.slug, self.markdown, self.html, self.image, self.featured, self.page, self.status,self.language, self.meta_title, self.meta_description, self.author_id, self.created_at, self.created_by,self.updated_at, self.updated_by,self.published_at, self.published_by];
}

- (NSArray *)array {
    return @[self.idNumber,self.uuid,self.title,self.slug, self.markdown, self.html, self.image, self.featured, self.page, self.status,self.language, self.meta_title, self.meta_description, self.author_id, self.created_at, self.created_by,self.updated_at, self.updated_by,self.published_at, self.published_by];
}
@end
