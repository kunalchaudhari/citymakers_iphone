//
//  search_result_list.h
//  CityMakers
//
//  Created by Infusion on 2/26/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface search_result_list : UIViewController
{
    
}
@property (nonatomic,retain) IBOutlet UITableView *tableview;
@property (nonatomic,retain) IBOutlet NSDictionary *dictionary;

@property(nonatomic,retain)IBOutlet NSURLConnection *conn;
@property(nonatomic,retain)IBOutlet NSMutableData *mdata;
@property(nonatomic,retain)IBOutlet  NSMutableArray *dataArray;
@property(nonatomic,retain)IBOutlet NSDictionary *jsonData;
@end
