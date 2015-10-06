//
//  TestViewController.m
//  RESTfull
//
//  Created by ECEP2010 on 10/2/15.
//  Copyright (c) 2015 ECEP. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrCourses;

- (void)loadData;

@end

@implementation TestViewController

- (void)viewWillAppear:(BOOL)animated{
    
    // reload data
    [self loadData];
}

- (void)viewDidAppear:(BOOL)animated{
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
}

- (void)viewDidDisappear:(BOOL)animated{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Make self the delegate and datasource of the table view
    self.tblCourse.delegate = self;
    self.tblCourse.dataSource =self;
    
    // Initialize the dbManager property.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"dbCourses.sqlite"];
    
    // load data
    [self loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData{

    // Form the query
    NSString *query = @"select * from tblCourses";
    
    // get the result
    if (self.arrCourses != nil) {
        self.arrCourses = nil;
    }
    self.arrCourses = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    // reload data
    [self.tblCourse reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.arrCourses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    // Dequeue the cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSInteger indexOfCourseTitle = [self.dbManager.arrColumnNames indexOfObject:@"course_Title"];
    NSInteger indexOfCourseImg = [self.dbManager.arrColumnNames indexOfObject:@"course_Image"];
    
    NSLog(@" indexOfCourseTitle: %ld",(long)indexOfCourseTitle);
    
    UITextView *courseTitle = (UITextView *)[cell viewWithTag:2];
    courseTitle.text = [NSString stringWithFormat:@"%@", [[self.arrCourses objectAtIndex:indexPath.row] objectAtIndex:indexOfCourseTitle]];
    
    NSLog(@"aaaaaa: %@",[self.arrCourses objectAtIndex:indexPath.row]);
    courseTitle.font = [UIFont fontWithName:@"Arial" size:12];
    
    // get data image
    NSURL *url = [NSURL URLWithString:[[self.arrCourses objectAtIndex:indexPath.row] objectAtIndex:indexOfCourseImg]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    
    UIImageView *courseImage = (UIImageView *)[cell viewWithTag:1];
    courseImage.image = img;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
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
