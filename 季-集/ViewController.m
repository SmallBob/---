//
//  ViewController.m
//  季-集
//
//  Created by 王凯 on 15/1/19.
//  Copyright (c) 2015年 王凯. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray*ary;
@property(nonatomic,strong)NSArray*twoAry;

@property(nonatomic,strong)UISegmentedControl*sc;
@property(nonatomic,strong)UITableView*tableViewOne;

@property(nonatomic,strong)UITableView*tableViewTwo;


@property(nonatomic)BOOL isBool;
@end


@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.isBool = NO;
    
    if (!self.ary) {
        self.ary = @[@"1111111",@"2",@"3",@"4",@"5"];
    }
    
    if (!self.twoAry) {
        self.twoAry = @[@"5",@"2",@"3",@"4",@"5"];
    }
    
    
    
    self.sc = [[UISegmentedControl alloc]initWithItems:@[@"1",@"2"]];
    self.sc.frame = CGRectMake(10, 100, 200, 40);
    [self.sc addTarget:self action:@selector(changedSegment:) forControlEvents:UIControlEventValueChanged];
//    self.sc.segmentedControlStyle =UISegmentedControlStyleBar;
//    self.sc.backgroundColor = [UIColor redColor];
//    [sc setSelectedSegmentIndex:0];
//    self.sc.multipleTouchEnabled=NO;
    self.sc.momentary = YES;

    [self.view addSubview:self.sc ];
    
    // Do any additional setup after loading the view, typically from a nib.
}







- (void)extracted_method:(CGFloat)width
{
    
    if(!self.tableViewOne){
        
        
        
        self.tableViewOne = [[UITableView alloc]initWithFrame:CGRectMake(10, 140, width, 0)];
        
        self.tableViewOne.backgroundColor = [UIColor blueColor];
        
        
        [UIView animateWithDuration:1 animations:^{
            
            sleep(0.5);
            
            CGRect frame = self.tableViewOne.frame;
            frame.size.height = 4*50;
            self.tableViewOne.frame = frame;
            
        } completion:^(BOOL finished) {
            
            sleep(0.5);
            self.sc.enabled = YES;
        }];
        
        
        
        self.tableViewOne.dataSource =self;
        self.tableViewOne.delegate = self;
        
        [self.view addSubview: self.tableViewOne];
        
        
    }else {
        
        [UIView animateWithDuration:1 animations:^{
            
            CGRect frame = self.tableViewOne.frame;
            frame.size.height = 0;
            self.tableViewOne.frame = frame;
            
        } completion:^(BOOL finished) {
            
            
                [self.tableViewOne removeFromSuperview];
                self.tableViewOne = nil;
        
            
        }];
        
    }
}

- (void)extracted_method1:(CGFloat)width
{
    if(!self.tableViewTwo){
        
        
        
        self.tableViewTwo = [[UITableView alloc]initWithFrame:CGRectMake(10+width, 140, width, 0)];
        
        self.tableViewTwo.backgroundColor = [UIColor blueColor];
        
        
        [UIView animateWithDuration:1 animations:^{
            
            sleep(0.5);
            
            CGRect frame = self.tableViewTwo.frame;
            frame.size.height = 4*50;
            self.tableViewTwo.frame = frame;
            
        } completion:^(BOOL finished) {
            
            sleep(0.5);
            self.sc.enabled = YES;
        }];
        
        
        
        self.tableViewTwo.dataSource =self;
        self.tableViewTwo.delegate = self;
        
        [self.view addSubview: self.tableViewTwo];
        
        
    }else {
        
        [UIView animateWithDuration:1 animations:^{
            
            CGRect frame = self.tableViewTwo.frame;
            frame.size.height = 0;
            self.tableViewTwo.frame = frame;
            
        } completion:^(BOOL finished) {
            
            
            [self.tableViewTwo removeFromSuperview];
            self.tableViewTwo = nil;
            
            
        }];
        
    }
}

-(void)changedSegment:(UISegmentedControl*)sender
{
    
    CGFloat width =sender.frame.size.width/2;
    
    switch (sender.selectedSegmentIndex) {
        case 0:
       {

           [self extracted_method:width];
        
            
        }
            break;
        case 1:
        {
            
            [self extracted_method1:width];
     
        }
            
            break;
            
        default:
            break;
    }


}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (self.sc.selectedSegmentIndex) {
        case 0:
            return self.ary.count;
            

            break;
        case 1:
            return self.twoAry.count;
            break;
        default:
            return 0;
            break;
        }
    
    
    NSLog(@"%d,  ",self.sc.selectedSegmentIndex);
    
    [tableView reloadData];

    
    }

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*identifier = @"cell";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    switch (self.sc.selectedSegmentIndex) {
        case 0:
        {
            cell.textLabel.text = self.ary[indexPath.row];
            

        
        }
            break;
        case 1:
        {
            
            cell.textLabel.text = self.twoAry[indexPath.row];
                    }
           
            break;
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    UIView*v = [[UIView alloc]init];
    v.backgroundColor = [UIColor redColor];
    [cell addSubview:v];
    
    
    cell.selectedBackgroundView = v;
    NSLog(@"%d,  ",self.sc.selectedSegmentIndex);
    
    
       return cell;



}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if ([tableView isEqual:self.tableViewOne]) {
        [self.sc setTitle:self.ary[indexPath.row] forSegmentAtIndex:0];
    }else if([tableView isEqual:self.tableViewTwo])
    {
        [self.sc setTitle:self.twoAry[indexPath.row] forSegmentAtIndex:1];

    }else{
        [self.sc setTitle:@"未知" forSegmentAtIndex:0];
        [self.sc setTitle:@"未知" forSegmentAtIndex:1];
    }
    
    


//    NSLog(@"%d--------%.2f",self.view.subviews.count,self.tableViewOne.frame.size.height);

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
