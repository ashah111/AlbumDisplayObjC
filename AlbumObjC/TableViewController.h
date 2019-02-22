//
//  TableViewController.h
//  AlbumObjC
//
//  Created by Ayushi shah on 2019-01-08.
//  Copyright © 2019 Ayushi shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

NS_ASSUME_NONNULL_BEGIN
@class TableModel;

@interface TableViewController : UITableViewController

@property (strong, nonatomic) Album *album_value;
@property (nonatomic, strong, readonly) NSMutableArray <Album *> *json;

@end

NS_ASSUME_NONNULL_END
