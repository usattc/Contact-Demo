//
//  ContactCell.m
//  2014-10-31-2
//
//  Created by TTC on 10/31/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import "ContactCell.h"
#import "ContactData.h"

@implementation ContactCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setData:(ContactData *)data {
    _data = data;
    self.textLabel.text = _data.name;
    self.detailTextLabel.text = _data.number;
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
