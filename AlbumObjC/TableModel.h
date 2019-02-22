//
//  TableModel.h
//  AlbumObjC
//
//  Created by Ayushi shah on 2019-01-08.
//  Copyright © 2019 Ayushi shah. All rights reserved.
//
NS_ASSUME_NONNULL_BEGIN

@interface TableModel : NSObject

@property (strong, nonatomic) NSURL *url;
-(void)downloadImage:(NSString*)url callback:(void (^)(NSURL *url, UIImage* image))completion;
-(void)getJSONfromUrl:(void (^)(NSArray* jsonData))completion;
@end

NS_ASSUME_NONNULL_END
