//
//  RSSDetail.h
//  RSSReader
//
//  Created by Carlos Alcala on 1/14/15.
//  Copyright (c) 2015 RGA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSDetail : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) NSString *feedURL;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
