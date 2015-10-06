//
//  LoadImageCollectionViewController.h
//  RESTfull
//
//  Created by ECEP2010 on 10/5/15.
//  Copyright (c) 2015 ECEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadImageCollectionViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource>

//@property (nonatomic, weak) IBOutlet UICollectionView *collectionViewImage;

@property (nonatomic, strong) NSString *dataContent;

@end
