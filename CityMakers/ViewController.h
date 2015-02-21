//
//  ViewController.h
//  CityMakers
//
//  Created by Infusion on 2/18/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIImageView *profileimg;
    UILabel *lbl_name,*lbl_work,*lbl_num1,*lbl_num2,*lbl_availibility,*lbl_address,*lbl_city,*lbl_state,*lbl_comment;
}
@property(nonatomic,strong)IBOutlet UIImageView *profileimg;

@property(nonatomic,retain)IBOutlet NSURLConnection *conn;
@property(nonatomic,retain)IBOutlet NSMutableData *mdata;
@property(nonatomic,retain)IBOutlet  NSArray *dataArray;
@property(nonatomic,retain)IBOutlet NSDictionary *jsonData;

@property(nonatomic,strong)IBOutlet UILabel *lbl_name,*lbl_work,*lbl_num1,*lbl_num2,*lbl_availibility,*lbl_address,*lbl_city,*lbl_state,*lbl_comment;
@end

