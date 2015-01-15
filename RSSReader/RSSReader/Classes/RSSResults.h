//
//  RSSResults.h
//  RSSReader
//
//  Created by Carlos Alcala on 1/14/15.
//  Copyright (c) 2015 RGA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSResults : UITableViewController {
    NSDateFormatter *formatter;
}

@property (nonatomic, strong) NSArray *itemsFiltered;

@end
