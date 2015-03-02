//
//  Profile_page.m
//  CityMakers
//
//  Created by Infusion on 2/26/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import "Profile_page.h"

@interface Profile_page ()

@end

@implementation Profile_page
@synthesize profileimg;
@synthesize lbl_name,lbl_work,lbl_num1,lbl_num2,lbl_availibility,lbl_address,lbl_city,lbl_state,lbl_comment;

@synthesize jsonData,dataArray;
@synthesize conn,mdata;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    profileimg.layer.cornerRadius = profileimg.frame.size.height /2;
    profileimg.layer.masksToBounds = YES;
    profileimg.layer.borderWidth = 0;
    profileimg.layer.borderColor=[UIColor blueColor].CGColor;
    
    [self loaddata];
}
-(void)loaddata
{
    
    NSString *urlStr = [NSString stringWithFormat:@"http://localhost:3000/city_makers/1.json"];
    
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    conn = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    if(conn)
        self.mdata = [NSMutableData data];
    
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.mdata setLength:0];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.mdata appendData:data];
}

- (void) conncetion:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *v=[[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Server Could Not be Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [v show];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *responseString = [[NSString alloc]initWithBytes:[self.mdata mutableBytes] length:[self.mdata length] encoding:NSASCIIStringEncoding];
    
    NSData *data=[responseString dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSError * jsonParsingError;
    self.jsonData= [NSJSONSerialization JSONObjectWithData:data                                                        options:kNilOptions error:&jsonParsingError ];
    
    // NSLog(@"%@",self.jsonData);
    
    
    NSString *name = [self.jsonData objectForKey:@"name"];
    NSString *description = [self.jsonData objectForKey:@"description"];
    NSString *num1 = [self.jsonData objectForKey:@"mobile"];
    NSString *num2 = [self.jsonData objectForKey:@"landline"];
    NSString *email = [self.jsonData objectForKey:@"email"];
    NSString *address = [self.jsonData objectForKey:@"address1"];
    NSString *city = [self.jsonData objectForKey:@"city"];
    NSString *state = [self.jsonData objectForKey:@"state"];
    
    //    NSLog(@"CityMaker Name %@",name);
    //    NSLog(@"Description %@",description);
    //    NSLog(@"Mobile Number %@",num1);
    
    lbl_name.text = name;
    lbl_work.text = description;
    lbl_num1.text = num1;
    lbl_num2.text = num2;
    lbl_availibility.text = email;;
    lbl_address.text = address;
    lbl_city.text = city;;
    lbl_state.text = state;;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
