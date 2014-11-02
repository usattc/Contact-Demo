//
//  DetailViewController.h
//  2014-10-31-2
//
//  Created by TTC on 10/31/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactData.h"

@protocol PassValueDelegate

- (void)passValue:(ContactData *)data;

@end


@interface DetailViewController : UIViewController

@property (nonatomic, assign) id<PassValueDelegate> delegate;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *number;

@end
