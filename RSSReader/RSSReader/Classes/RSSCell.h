//
//  RSSCell.h
//  RSSReader
//
//  Created by Carlos Alcala on 1/14/15.
//  Copyright (c) 2015 RGA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *thumb;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;


@end
