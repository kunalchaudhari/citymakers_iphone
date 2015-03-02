//
//  ViewController.m
//  CityMakers
//
//  Created by Infusion on 2/18/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import "ViewController.h"
#import "search_result_list.h"
#import "Profile_page.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
}

-(IBAction)btn_clicked:(id)sender
{
    search_result_list *srl = [[search_result_list alloc]init];
    [self.navigationController pushViewController:srl animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
