# LHSOtherAppsViewController

This is an easy way for you to show your users the other apps that you have developed. Here's what it looks like in one of our apps, [Tweet Seeker](https://itunes.apple.com/us/app/tweet-seeker-search-your-tweets/id775980722?mt=8).

<p align="center">
  <img src="http://i.imgur.com/iAA0u7u.png" style="max-width:400px;"/>
</p>

## Usage

Integrating LHSOtherAppsViewController into your project is pretty straightforward. You just need to instantiate the view controller, set the developerURL, and present it.

#### Note: 
Your developerURL will probably be the following - https://itunes.apple.com/lookup?id=[DEVELOPER_ID]&entity=software
<br> You can find out your Developer ID by going to the app store and clicking "More By This Developer". Your id will be at the end of that url.

Here's how I implemented this in the above application, [Tweet Seeker](https://itunes.apple.com/us/app/tweet-seeker-search-your-tweets/id775980722?mt=8).

### Necessary import for LHSOtherAppsViewController

```objc
#import <LHSOtherAppsViewController/LHSOtherAppsViewController.h>
```

### Implementation 

```objc
LHSOtherAppsViewController *otherAppsViewController = [[LHSOtherAppsViewController alloc] init];
otherAppsViewController.developerURL = @"https://itunes.apple.com/lookup?id=548052593&entity=software";
[self.navigationController pushViewController:otherAppsViewController
                                     animated:YES];
```

## Requirements

iOS 7 or higher

## Installation

LHSOtherAppsViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LHSOtherAppsViewController"
```

## Author

Eric Olszewski, eric@lionheartsw.com

## License

LHSOtherAppsViewController is available under the Apache 2.0 license. See the LICENSE file for more info.
