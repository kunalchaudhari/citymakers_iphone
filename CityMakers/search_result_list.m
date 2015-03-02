//
//  search_result_list.m
//  CityMakers
//
//  Created by Infusion on 2/26/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import "search_result_list.h"
#import "Search_result.h"

@interface search_result_list ()

@end

@implementation search_result_list
@synthesize tableview,dictionary;

@synthesize jsonData,dataArray;
@synthesize conn,mdata;


- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = [[NSMutableArray alloc]init];
    [self loaddata];
    // Do any additional setup after loading the view from its nib.
}

-(void)loaddata{
    
    NSString *urlStr = [NSString stringWithFormat:@"http://localhost:3000/city_makers.json"];
    
    NSLog(@"Url print %@",urlStr);
    
    //NSURL *url=[NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    conn = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    if(conn)
        self.mdata = [NSMutableData data];
    // Do any additional setup after loading the view, typically from a nib.
    
    
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
    NSLog(@"%@",responseString);
    NSData *data=[responseString dataUsingEncoding:NSUTF8StringEncoding];
    
    //self.jsonData = [data objectFromJSONData];
    NSError * jsonParsingError;
    dataArray= [NSJSONSerialization JSONObjectWithData:data                                                        options:kNilOptions error:&jsonParsingError ];
    
       
//   
//    for (int j=0; j<[dataArray count]; j++) {
//        
//       // NSString *name = [self.jsonData ob objectForKey:@"name"];
//        
//        NSString *name =  [self.jsonData valueForKey:@"name"];
//        NSString *description = [self.jsonData valueForKey:@"description"];
//        NSString *num1 = [self.jsonData valueForKey:@"mobile"];
//        NSString *num2 = [self.jsonData valueForKey:@"landline"];
//        
//        NSLog(@"name%@",name);
//        NSLog(@"description %@",description);
//        NSLog(@"mobile %@",num1);
//        NSLog(@"landline %@",num2);
//        
//    }

    
        [tableview reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSLog(@"d=========%d",dataArray.count);
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    
    
    Search_result *cell = (Search_result *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell==nil)
    {
        
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"Search_result" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    
        cell.lbl_name.text=[[dataArray objectAtIndex:indexPath.row] objectForKey:@"name"];
        cell.lbl_num1.text=[[dataArray objectAtIndex:indexPath.row] objectForKey:@"mobile"];
        cell.lbl_num2.text=[[dataArray objectAtIndex:indexPath.row] objectForKey:@"landline"];
        cell.lbl_work.text=[[dataArray objectAtIndex:indexPath.row] objectForKey:@"description"];
    
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
