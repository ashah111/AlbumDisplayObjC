//
//  TableViewController.m
//  AlbumObjC
//
//  Created by Ayushi shah on 2019-01-08.
//  Copyright © 2019 Ayushi shah. All rights reserved.
//

#import "TableViewController.h"
#import "TableModel.h"
#import "Album.h"

@interface TableViewController()

@property (nonatomic, assign) NSUInteger size;
@property (nonatomic, strong) NSString *main_url;
@property (nonatomic, strong, readwrite) NSMutableArray <Album *> *json;

@end

@implementation TableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.main_url = @"http://jsonplaceholder.typicode.com/albums/1/photos";
        self.json = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak TableViewController *weakSelf = self;
    TableModel *modelView = [[TableModel alloc] init];
    [modelView getJSONfromUrl:^(NSArray * jsonData) {
        weakSelf.json = [jsonData mutableCopy];
        weakSelf.size = weakSelf.json.count;
        dispatch_async(dispatch_get_main_queue(), ^{
            [[weakSelf tableView] reloadData];
        });
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.json.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"album" forIndexPath:indexPath];
     cell.textLabel.text = [self.json[indexPath.row] valueForKeyPath:@"title"];
     NSString *image_url = [_json[indexPath.row] valueForKeyPath:@"url"];
     TableModel *modelView = [[TableModel alloc] init];
     dispatch_async((dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)), ^(void){
         [modelView downloadImage:image_url callback:^(NSURL* path, UIImage* image){
             NSURL *url = [[NSURL alloc] initWithString:image_url];
             if ([path isEqual:url]){
                 dispatch_async(dispatch_get_main_queue(), ^{
                     cell.imageView.image = image;
                 });
             }
         }];
     });
     return cell;
 }
 

@end
