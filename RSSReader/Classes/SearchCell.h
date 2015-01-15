//
//  SearchCell.h
//  RSSReader
//
//  Created by Carlos Alcala on 1/15/15.
//  Copyright (c) 2015 RGA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@end
