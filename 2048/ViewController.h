//
//  ViewController.h
//  2048
//
//  Created by berk on 1/27/17.
//  Copyright © 2017 berk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Table.h"

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet Table *table;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *upSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *downSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *leftSwipe;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *gameButton;

- (void)updateScore;

@end

