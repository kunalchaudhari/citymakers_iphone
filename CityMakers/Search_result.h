//
//  Search_result.h
//  CityMakers
//
//  Created by Infusion on 2/26/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Search_result : UITableViewCell
{
    
}
@property (retain, nonatomic) IBOutlet UIImageView *reting;
@property (retain, nonatomic) IBOutlet UIButton *btn_call,*btn_navigation;
@property (retain, nonatomic) IBOutlet UILabel *lbl_name,*lbl_proffession,*lbl_skills,*lbl_work,*lbl_num1,*lbl_num2;
@property (nonatomic,retain) IBOutlet UIImageView *imgview_img;
@end
