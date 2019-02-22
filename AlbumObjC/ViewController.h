//
//  ViewController.h
//  AlbumObjC
//
//  Created by Ayushi shah on 2019-01-08.
//  Copyright © 2019 Ayushi shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property NSInteger *size;

- (NSInteger) numberOfSections: (UITableView*)tableView;
- (NSInteger) tableView: (UITableView*)tableView secondValue:(NSInteger)numberOfRowsInSection;


@end

