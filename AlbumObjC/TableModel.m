//
//  TableModel.m
//  AlbumObjC
//
//  Created by Ayushi shah on 2019-01-08.
//  Copyright © 2019 Ayushi shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableModel : NSObject

@property (strong, nonatomic) NSURL *url;

@end

@implementation TableModel
NSString *j_url = @"http://jsonplaceholder.typicode.com/albums/1/photos";

-(void)getJSONfromUrl:(void (^)(NSArray* jsonData))completion{
    self.url = [NSURL URLWithString:j_url];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession]dataTaskWithURL:self.url completionHandler:^( NSData *data, NSURLResponse *response, NSError *error){
        if(data==nil || error){
            return;
        }else{
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            //if([object isKindOfClass:[NSMutableArray class]]){
                NSMutableArray *json = object;
                completion(json);
            //}
            
        }
    }];
    [dataTask resume];
    

}

-(void)downloadImage:(NSString*)url callback:(void (^)(NSURL *url, UIImage* image))completion{
    self.url = [NSURL URLWithString:url];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession]dataTaskWithURL:self.url completionHandler:^( NSData *data, NSURLResponse *response, NSError *error){
        if(data==nil || error){
            return;
        }else{
            UIImage *send_image = [UIImage imageWithData:data];
            completion(response.URL, send_image);
            }
            
        }];
    [dataTask resume];
}

@end


