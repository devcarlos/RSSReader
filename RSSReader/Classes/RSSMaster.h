//
//  RSSMaster.h
//  RSSReader
//
//  Created by Carlos Alcala on 1/14/15.
//  Copyright (c) 2015 RGA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"
#import "RSSResults.h"

@interface RSSMaster : UITableViewController <MWFeedParserDelegate, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>{
    
    // Parsing
    MWFeedParser *feedParser;
    NSMutableArray *parsedItems;
    
    // Displaying
    NSMutableArray *itemsToDisplay;
    NSDateFormatter *formatter;
    
}

@property (nonatomic, strong) UISearchController *searchController;

// our secondary search results table view
@property (nonatomic, strong) RSSResults *resultsTC;

// for state restoration
@property BOOL searchControllerWasActive;
@property BOOL searchControllerSearchFieldWasFirstResponder;

// Properties
@property (nonatomic, strong) NSMutableArray *filteredItems;
@property (nonatomic, strong) NSMutableArray *itemsToDisplay;
@property (nonatomic, strong) NSString *rssURL;
@property (nonatomic, strong) NSTimer *reloadTimer;

@end
