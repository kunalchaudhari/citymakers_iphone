//
//  Search_result.m
//  CityMakers
//
//  Created by Infusion on 2/26/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import "Search_result.h"

@implementation Search_result
@synthesize imgview_img;
@synthesize btn_call,btn_navigation;
@synthesize lbl_name,lbl_proffession,lbl_skills,lbl_work,lbl_num1,lbl_num2;
- (void)awakeFromNib {
    imgview_img.layer.cornerRadius = 25;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
