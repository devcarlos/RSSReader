//
//  RSSResults.m
//  RSSReader
//
//  Created by Carlos Alcala on 1/14/15.
//  Copyright (c) 2015 RGA. All rights reserved.
//

#import "RSSResults.h"
#import "RSSCell.h"
#import "SearchCell.h"
#import "NSString+HTML.h"
#import "MWFeedItem.h"

@interface RSSResults ()

@end

@implementation RSSResults

- (void)viewDidLoad {
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SearchCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SearchCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsFiltered.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"SearchCell";
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[SearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    MWFeedItem *item = [self.itemsFiltered objectAtIndex:indexPath.row];
    
    if (item) {
        
        // Process
        NSString *itemTitle = item.title ? [item.title stringByConvertingHTMLToPlainText] : @"[No Title]";
        NSString *itemSummary = item.summary ? [item.summary stringByConvertingHTMLToPlainText] : @"[No Description]";
        
        NSString *imageURLstr = item.thumbnailURL ? item.thumbnailURL : @"";
        
        // title
        cell.title.font = [UIFont boldSystemFontOfSize:15];
        cell.title.text = itemTitle;
        
        NSMutableString *description = [NSMutableString string];
        if (item.date) [description appendFormat:@"%@: ", [formatter stringFromDate:item.date]];
        [description appendString:itemSummary];
        
        cell.desc.text = description;
        
        
        // simple image async downloader
        // for production we should use 3rd party frameworks like:
        // https://github.com/nicklockwood/AsyncImageView
        // https://github.com/rs/SDWebImage
        
        NSLog(@"IMAGE URL: %@", imageURLstr);
        
        if (![imageURLstr isEqualToString:@""]) {
            NSURL *imageURL = [NSURL URLWithString:imageURLstr];
            
            //image download
            dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
            dispatch_async(q, ^{
                /* Fetch the image from the server... */
                NSData *data = [NSData dataWithContentsOfURL:imageURL];
                UIImage *img = [[UIImage alloc] initWithData:data];
                dispatch_async(dispatch_get_main_queue(), ^{
                    /* This is the main thread again, where we set the tableView's image to
                     be what we just fetched. */
                    cell.thumbnail.image = img;
                });
            });
        }
    }
    
    return cell;
}

@end
