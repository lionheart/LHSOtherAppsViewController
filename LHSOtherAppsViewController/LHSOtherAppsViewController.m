//
//  LHSOtherAppsViewController.m
//
//  Created by Eric Olszewski on 2/8/15.
//  Copyright (c) 2015 Lionheart Software. All rights reserved.
//

#import "LHSOtherAppsViewController.h"

#import <SDWebImage/UIImageView+WebCache.h>

static NSString * CellIdentifier = @"CellIdentifier";

@interface LHSOtherAppsViewController ()

@property (nonatomic, strong) NSMutableArray *apps;

@end

@implementation LHSOtherAppsViewController


- (id)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Our Apps";

    self.apps = [NSMutableArray array];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/lookup?id=548052593&entity=software"]];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:nil];
                               
                               for (NSDictionary *app in JSON[@"results"]) {
                                   NSString *name = app[@"trackName"];
                                   if (name) {
                                       [self.apps addObject:app];
                                   }
                               }
                               
                               [self.tableView reloadData];
                           }];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.apps.count == 0) {
        return 1;
    }
    else {
        return self.apps.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    if (self.apps.count == 0) {
        cell.textLabel.text = @"Loading";
        
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        
        cell.accessoryView = spinner;
        [spinner startAnimating];
    }
    else {
        NSDictionary *app = self.apps[indexPath.row];
        NSString *ratingCount = app[@"userRatingCount"];
        NSString *currentRating = app[@"averageUserRating"];
        NSString *starString = @"";
        
        cell.textLabel.text = [app[@"trackName"] componentsSeparatedByString:@"-"][0];
        
        if (ratingCount == nil) {
            ratingCount = @"0";
        }
        
        if (currentRating) {
            NSNumber *starRating = @(ceil(currentRating.doubleValue));
            
            for (NSInteger i = 0; i < 5; i++) {
                if ([starRating intValue] - i > 0) {
                    starString = [starString stringByAppendingString:@"★"];
                }
                else {
                    starString = [starString stringByAppendingString:@"☆"];
                }
            }
            
            starString = [starString stringByAppendingString:@" "];
        }

        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@ reviews", starString, ratingCount];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:app[@"artworkUrl60"]]
                          placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.apps[indexPath.row][@"trackViewUrl"]]];
}

@end
