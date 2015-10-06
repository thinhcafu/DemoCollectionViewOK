//
//  TestViewController.h
//  RESTfull
//
//  Created by ECEP2010 on 10/2/15.
//  Copyright (c) 2015 ECEP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface TestViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSString *dataContent;

@property (nonatomic, weak) IBOutlet UITableView *tblCourse;

//@property (weak, nonatomic) IBOutlet UIImageView *imageViewCourseImg;
//
//@property (weak, nonatomic) IBOutlet UITextView *textViewCourseTitle;

@end
