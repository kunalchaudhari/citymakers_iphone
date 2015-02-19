//
//  ViewController.m
//  CityMakers
//
//  Created by Infusion on 2/18/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize profileimg;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    profileimg.layer.cornerRadius = profileimg.frame.size.height /2;
    profileimg.layer.masksToBounds = YES;
    profileimg.layer.borderWidth = 0;
    profileimg.layer.borderColor=[UIColor blueColor].CGColor;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
