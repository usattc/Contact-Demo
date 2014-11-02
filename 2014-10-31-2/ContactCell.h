//
//  ContactCell.h
//  2014-10-31-2
//
//  Created by TTC on 10/31/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactData;

@interface ContactCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) ContactData *data;

@end
