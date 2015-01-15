//
//  RSSDetail.m
//  RSSReader
//
//  Created by Carlos Alcala on 1/14/15.
//  Copyright (c) 2015 RGA. All rights reserved.
//

#import "RSSDetail.h"

@interface RSSDetail ()

@end

@implementation RSSDetail

@synthesize feedURL, webView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //load Web View URL
    NSURL *URL = [NSURL URLWithString:feedURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:URL];
    webView.delegate = self;
    [webView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WebView delegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webV {
    
    self.title = [webV stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    //log errors loading, normal on WebViews
    NSLog(@"Error Loading: %@", error.localizedDescription);
}

@end
