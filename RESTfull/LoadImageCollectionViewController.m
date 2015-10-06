//
//  LoadImageCollectionViewController.m
//  RESTfull
//
//  Created by ECEP2010 on 10/5/15.
//  Copyright (c) 2015 ECEP. All rights reserved.
//

#import "LoadImageCollectionViewController.h"
#import "DBManager.h"
#import "ViewController.h"
#import "InfoViewController.h"
#import "TestViewController.h"

@interface LoadImageCollectionViewController ()

@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrCourses;

- (void)loadData;

@end

@implementation LoadImageCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
//    self.collectionViewImage.delegate =self;
//    self.collectionViewImage.dataSource =self;
    
    // Initialize the dbManager property.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"dbCourses.sqlite"];
    
    // load data
    [self loadData];
    NSLog(@"111111");

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) loadData{

    
    // Form the query
    NSString *query = @"select * from tblCourses";
    
    // get the result
    if (self.arrCourses != nil) {
        self.arrCourses = nil;
    }
    self.arrCourses = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    // reload data
    [self.collectionView reloadData];

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.arrCourses.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell
    NSInteger indexOfCourseImg = [self.dbManager.arrColumnNames indexOfObject:@"course_Image"];
    NSInteger indexOfCourseTitle = [self.dbManager.arrColumnNames indexOfObject:@"course_Title"];
    
    UILabel *labelTitle = (UILabel *)[cell viewWithTag:1];
    labelTitle.text = [NSString stringWithFormat:@"%@", [[self.arrCourses objectAtIndex:indexPath.row] objectAtIndex:indexOfCourseTitle]];    
    NSURL *url = [NSURL URLWithString:[[self.arrCourses objectAtIndex:indexPath.row] objectAtIndex:indexOfCourseImg]];
    NSLog(@"url la: %@",url);
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    //NSLog(@"ket qua data: %@",data);
    UIImage *img = [[UIImage alloc] initWithData:data];
    
    UIImageView *courseImage = (UIImageView *)[cell viewWithTag:2];
    courseImage.image = img;
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];

    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
